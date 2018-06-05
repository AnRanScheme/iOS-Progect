//
//  MagiTransitionPreprocessor.swift
//  MagicApp
//
//  Created by 安然 on 2018/6/5.
//  Copyright © 2018年 MacBook. All rights reserved.
//

import UIKit

public enum MagiMotionTransitionAnimationType {
    
    public enum Direction {
        case left
        case right
        case up
        case down
    }
    
    case none
    case auto
    case push(direction: Direction)
    case pull(direction: Direction)
    case cover(direction: Direction)
    case uncover(direction: Direction)
    case slide(direction: Direction)
    case zoomSlide(direction: Direction)
    case pageIn(direction: Direction)
    case pageOut(direction: Direction)
    case fade
    case zoom
    case zoomOut
    
    /// 递归枚举 在枚举里面使用枚举值   作用确定枚举的具体数值
    indirect case selectBy(presenting: MagiMotionTransitionAnimationType, dismissing: MagiMotionTransitionAnimationType)
    
    ///  Sets the presenting and dismissing modifiers.
    ///
    /// - Parameter presenting: A MagiMotionTransitionAnimationType.
    /// - Returns: A MagiMotionTransitionAnimationType.
    public static func autoReverse(presenting: MagiMotionTransitionAnimationType) -> MagiMotionTransitionAnimationType {
        return .selectBy(presenting: presenting, dismissing: presenting.reversed())
    }
    
    /// Returns a reversal transition.
    func reversed() -> MagiMotionTransitionAnimationType {
        switch self {
        case .push(direction: .up):
            return .pull(direction: .down)
            
        case .push(direction: .right):
            return .pull(direction: .left)
            
        case .push(direction: .down):
            return .pull(direction: .up)
            
        case .push(direction: .left):
            return .pull(direction: .right)
            
        case .pull(direction: .up):
            return .push(direction: .down)
            
        case .pull(direction: .right):
            return .push(direction: .left)
            
        case .pull(direction: .down):
            return .push(direction: .up)
            
        case .pull(direction: .left):
            return .push(direction: .right)
            
        case .cover(direction: .up):
            return .uncover(direction: .down)
            
        case .cover(direction: .right):
            return .uncover(direction: .left)
            
        case .cover(direction: .down):
            return .uncover(direction: .up)
            
        case .cover(direction: .left):
            return .uncover(direction: .right)
            
        case .uncover(direction: .up):
            return .cover(direction: .down)
            
        case .uncover(direction: .right):
            return .cover(direction: .left)
            
        case .uncover(direction: .down):
            return .cover(direction: .up)
            
        case .uncover(direction: .left):
            return .cover(direction: .right)
            
        case .slide(direction: .up):
            return .slide(direction: .down)
            
        case .slide(direction: .down):
            return .slide(direction: .up)
            
        case .slide(direction: .left):
            return .slide(direction: .right)
            
        case .slide(direction: .right):
            return .slide(direction: .left)
            
        case .zoomSlide(direction: .up):
            return .zoomSlide(direction: .down)
            
        case .zoomSlide(direction: .down):
            return .zoomSlide(direction: .up)
            
        case .zoomSlide(direction: .left):
            return .zoomSlide(direction: .right)
            
        case .zoomSlide(direction: .right):
            return .zoomSlide(direction: .left)
            
        case .pageIn(direction: .up):
            return .pageOut(direction: .down)
            
        case .pageIn(direction: .right):
            return .pageOut(direction: .left)
            
        case .pageIn(direction: .down):
            return .pageOut(direction: .up)
            
        case .pageIn(direction: .left):
            return .pageOut(direction: .right)
            
        case .pageOut(direction: .up):
            return .pageIn(direction: .down)
            
        case .pageOut(direction: .right):
            return .pageIn(direction: .left)
            
        case .pageOut(direction: .down):
            return .pageIn(direction: .up)
            
        case .pageOut(direction: .left):
            return .pageIn(direction: .right)
            
        case .zoom:
            return .zoomOut
            
        case .zoomOut:
            return .zoom
            
        default:
            return self
        }
    }

}
