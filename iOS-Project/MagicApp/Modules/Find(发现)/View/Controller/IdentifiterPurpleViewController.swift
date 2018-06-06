//
//  IdentifiterPurpleViewController.swift
//  MagicApp
//
//  Created by 安然 on 2018/6/5.
//  Copyright © 2018年 MacBook. All rights reserved.
//

import UIKit


class IdentifiterPurpleViewController: UIViewController {
    fileprivate var v1 = View()
    fileprivate var v2 = View()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareTransitionViews()
        prepareAnimation()
        
        MagiMotion.delay(2) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}

extension IdentifiterPurpleViewController {
    fileprivate func prepareView() {
        isMotionEnabled = true
        view.backgroundColor = Color.green.base
    }
    
    fileprivate func prepareTransitionViews() {
        v1.backgroundColor = Color.deepOrange.base
        v2.backgroundColor = Color.blueGrey.lighten3
    }
    
    fileprivate func prepareAnimation() {
        //        animationMatch()
        //        animationScale()
        animationTranslate()
        //        animationRotate()
        //        animationArc()
    }
}

extension IdentifiterPurpleViewController {
    fileprivate func animationMatch() {
        v1.motionIdentifier = "v1"
        view.layout(v1).top().horizontally().height(200)
        
        v2.motionIdentifier = "v2"
        view.layout(v2).bottom().horizontally().height(70)
    }
    
    fileprivate func animationScale() {
        v1.layer.cornerRadius = 15
        view.layout(v1).center(offsetY: 50).width(200).height(200)
        v1.transition(.scale(0.3), .corner(radius: 15))
        
        v2.motionIdentifier = "v2"
        v2.layer.cornerRadius = 15
        view.layout(v2).center(offsetY: -100).width(200).height(50)
    }
    
    fileprivate func animationTranslate() {
        v1.layer.cornerRadius = 15
        view.layout(v1).center(offsetY: 50).width(200).height(200)
        v1.transition(.translate(x: -200), .corner(radius: 15))
        
        v2.motionIdentifier = "v2"
        v2.layer.cornerRadius = 15
        view.layout(v2).center(offsetY: -100).width(200).height(50)
    }
    
    fileprivate func animationRotate() {
        v1.layer.cornerRadius = 15
        view.layout(v1).center(offsetY: 50).width(200).height(200)
        v1.transition(.translate(x: -200, y: 100), .rotate(270), .corner(radius: 15))
        
        v2.motionIdentifier = "v2"
        v2.layer.cornerRadius = 15
        view.layout(v2).center(offsetY: -100).width(200).height(50)
    }
    
    fileprivate func animationArc() {
        v2.motionIdentifier = "v2"
        v2.shapePreset = .circle
        v2.transition(.arc())
        view.layout(v2).center(offsetX: -100, offsetY: -100).width(100).height(100)
    }
}

