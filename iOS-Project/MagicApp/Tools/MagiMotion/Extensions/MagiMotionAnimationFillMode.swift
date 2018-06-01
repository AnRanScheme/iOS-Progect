//
//  MagiMotionAnimationFillMode.swift
//  MagicApp
//
//  Created by 安然 on 2018/5/31.
//  Copyright © 2018年 MacBook. All rights reserved.
//

import UIKit

@objc(MagiMotionAnimationFillMode)
public enum MagiMotionAnimationFillMode: Int {
    case forwards
    case backwards
    case both
    case removed
}

/**
 Converts the MotionAnimationFillMode enum value to a corresponding String.
 - Parameter mode: An MotionAnimationFillMode enum value.
 */
public func MagiMotionAnimationFillModeToValue(mode: MagiMotionAnimationFillMode) -> String {
    switch mode {
    case .forwards:
        return kCAFillModeForwards
    case .backwards:
        return kCAFillModeBackwards
    case .both:
        return kCAFillModeBoth
    case .removed:
        return kCAFillModeRemoved
    }
}
