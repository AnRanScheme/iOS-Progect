//
//  IdentifiterOrangeViewController.swift
//  MagicApp
//
//  Created by 安然 on 2018/6/5.
//  Copyright © 2018年 MacBook. All rights reserved.
//

import UIKit


class IdentifiterOrangeViewController: UIViewController {
    fileprivate var v1 = View()
    fileprivate var v2 = View()
    fileprivate var button = Button()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareTransitionViews()
        prepareAnimation()
        prepareButton()
    }
}

extension IdentifiterOrangeViewController {
    @objc
    fileprivate func handleButton() {
        present(IdentifiterPurpleViewController(), animated: true)
    }
}

extension IdentifiterOrangeViewController {
    fileprivate func prepareView() {
        isMotionEnabled = true
        view.backgroundColor = .white
    }
    
    fileprivate func prepareTransitionViews() {
        v1.backgroundColor = Color.deepOrange.base
        v2.backgroundColor = Color.blueGrey.lighten3
    }
    
    fileprivate func prepareAnimation() {
                animationMatch()
        //        animationScale()
        //animationTranslate()
        //        animationRotate()
        //        animationArc()
    }
    
    fileprivate func prepareButton() {
        button.backgroundColor = .clear
        button.pulseAnimation = .none
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        view.layout(button).edges()
    }
}

extension IdentifiterOrangeViewController {
    fileprivate func animationMatch() {
        v1.motionIdentifier = "v1"
        v1.layer.cornerRadius = 25
        view.layout(v1).center(offsetY: -50).width(200).height(200)
        
        v2.motionIdentifier = "v2"
        v2.shapePreset = .circle
        view.layout(v2).center(offsetY: 150).width(100).height(100)
    }
    
    fileprivate func animationScale() {
        v2.motionIdentifier = "v2"
        v2.shapePreset = .circle
        view.layout(v2).center().width(100).height(100)
    }
    
    fileprivate func animationTranslate() {
        v2.motionIdentifier = "v2"
        v2.shapePreset = .circle
        view.layout(v2).center().width(100).height(100)
    }
    
    fileprivate func animationRotate() {
        v2.motionIdentifier = "v2"
        v2.shapePreset = .circle
        view.layout(v2).center().width(100).height(100)
    }
    
    fileprivate func animationArc() {
        v2.motionIdentifier = "v2"
        v2.shapePreset = .circle
        v2.transition(.arc())
        view.layout(v2).center(offsetX: 100, offsetY: 100).width(100).height(100)
    }
}

