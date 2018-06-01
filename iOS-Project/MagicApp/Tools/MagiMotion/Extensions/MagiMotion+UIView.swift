//
//  MagiMotion+UIView.swift
//  MagicApp
//
//  Created by 安然 on 2018/5/31.
//  Copyright © 2018年 MacBook. All rights reserved.
//

import UIKit

fileprivate var AssociatedInstanceKey: UInt8 = 0

fileprivate struct AssociatedInstance {
    /// A boolean indicating whether Motion is enabled.
    fileprivate var isEnabled: Bool
    
    /// A boolean indicating whether Motion is enabled for subviews.
    fileprivate var isEnabledForSubviews: Bool
    
    /// An optional reference to the motion identifier.
    fileprivate var identifier: String?
    
    /// An optional reference to the motion animations.
    fileprivate var animations: [String]?
    
    /// An optional reference to the motion animation modifiers.
    fileprivate var modifiers: [String]?
    
    /// An alpha value.
    fileprivate var alpha: CGFloat?
}

fileprivate extension UIView {
    /// AssociatedInstance reference.
    fileprivate var associatedInstance: AssociatedInstance {
        get {
            return AssociatedObject.get(base: self, key: &AssociatedInstanceKey){
                return AssociatedInstance(isEnabled: true, isEnabledForSubviews: true, identifier: nil, animations: nil, modifiers: nil, alpha: nil)
            }
        }
        set(value) {
            AssociatedObject.set(base: self, key: &AssociatedInstanceKey, value: value)
        }
    }
}
