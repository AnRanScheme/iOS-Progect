//
//  MagiMotionAnimation.swift
//  MagicApp
//
//  Created by 安然 on 2018/5/31.
//  Copyright © 2018年 MacBook. All rights reserved.
//

public class MagiMotionAnimation {
    /// A reference to the callback that applies the MotionAnimationState.
    internal let apply: (inout MagiMotionAnimationState) -> Void
    
    /**
     An initializer that accepts a given callback.
     - Parameter applyFunction: A given callback.
     */
    init(applyFunction: @escaping (inout MagiMotionAnimationState) -> Void) {
        apply = applyFunction
    }
}
