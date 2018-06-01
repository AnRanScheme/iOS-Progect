//
//  MagiMotion.swift
//  MagicApp
//
//  Created by 安然 on 2018/5/31.
//  Copyright © 2018年 MacBook. All rights reserved.
//

import UIKit

public typealias MagiMotionCancelBlock = (Bool) -> Void

public class MagiMotion: NSObject {}

extension MagiMotion {
    /**
     Executes a block of code asynchronously on the main thread.
     - Parameter execute: A block that is executed asynchronously on the main thread.
     */
    public class func async(_ execute: @escaping () -> Void) {
        DispatchQueue.main.async(execute: execute)
    }
    
    /**
     Executes a block of code after a time delay.
     - Parameter _ time: A delay time.
     - Parameter execute: A block that is executed once delay has passed.
     - Returns: An optional MotionCancelBlock.
     */
    @discardableResult
    public class func delay(_ time: TimeInterval, execute: @escaping () -> Void) -> MagiMotionCancelBlock? {
        var cancelable: MagiMotionCancelBlock?
        
        let delayed: MagiMotionCancelBlock = {
            if !$0 {
                async(execute)
            }
            
            cancelable = nil
        }
        
        cancelable = delayed
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            cancelable?(false)
        }
        
        return cancelable
    }
    
    /**
     Cancels the delayed MotionCancelBlock.
     - Parameter delayed completion: An MotionCancelBlock.
     */
    public class func cancel(delayed completion: MagiMotionCancelBlock) {
        completion(true)
    }
    
    /**
     Disables the default animations set on CALayers.
     - Parameter animations: A callback that wraps the animations to disable.
     */
    public class func disable(_ animations: (() -> Void)) {
        animate(duration: 0, animations: animations)
    }
    
    /**
     Runs an animation with a specified duration.
     - Parameter duration: An animation duration time.
     - Parameter animations: An animation block.
     - Parameter timingFunction: A CAMediaTimingFunction.
     - Parameter completion: A completion block that is executed once
     the animations have completed.
     */
    public class func animate(duration: CFTimeInterval, timingFunction: CAMediaTimingFunction = .easeInOut, animations: (() -> Void), completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        CATransaction.setCompletionBlock(completion)
        CATransaction.setAnimationTimingFunction(timingFunction)
        animations()
        CATransaction.commit()
    }
    
    /**
     Creates a CAAnimationGroup.
     - Parameter animations: An Array of CAAnimation objects.
     - Parameter timingFunction: A CAMediaTimingFunction.
     - Parameter duration: An animation duration time for the group.
     - Returns: A CAAnimationGroup.
     */
    public class func animate(group animations: [CAAnimation], timingFunction: CAMediaTimingFunction = .easeInOut, duration: CFTimeInterval = 0.5) -> CAAnimationGroup {
        let group = CAAnimationGroup()
        group.fillMode = MagiMotionAnimationFillModeToValue(mode: .both)
        group.isRemovedOnCompletion = false
        group.animations = animations
        group.duration = duration
        group.timingFunction = timingFunction
        return group
    }
}
