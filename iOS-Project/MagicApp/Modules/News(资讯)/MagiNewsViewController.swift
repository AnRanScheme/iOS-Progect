//
//  MagiNewsViewController.swift
//  MagicApp
//
//  Created by 安然 on 2017/11/3.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import UIKit

class MagiNewsViewController: MagiBaseViewController {

    // MARK: - 控件
    
    fileprivate var animatedView = UIView()
    
    fileprivate var button = UIButton()

    // MARK: - 系统方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareAnimatedView()
        prepareButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension MagiNewsViewController {
    @objc
    fileprivate func handleButton() {
//        animateBackgroundColor()
//        animateBorderColor()
//        animateCornerRadius()
//        animateDepth()
//        animateFade()
//        animatePosition()
//        animateRotate()
//        animateScale()
//        animateSize()
//        animateSpin()
        animateSpring()
//        animateTranslate()
    }
}

extension MagiNewsViewController {
    fileprivate func prepareView() {
        view.backgroundColor = .white
    }
    
    fileprivate func prepareAnimatedView() {
        animatedView.backgroundColor = Color.deepPurple.base
        view.layout(animatedView).center().width(100).height(100)
    }
    
    fileprivate func prepareButton() {
        view.layout(button).edges()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
    }
}

extension MagiNewsViewController {
    fileprivate func animateBackgroundColor() {
        animatedView.shapePreset = .circle
       
        animatedView.animate(.delay(1),
                             .duration(0.5),
                             .background(color: Color.cyan.base),
                             .completion({ [weak self] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .background(color: Color.deepPurple.base))
                             }))
    }
}

extension MagiNewsViewController {
    fileprivate func animateBorderColor() {
        animatedView.shapePreset = .circle
        animatedView.borderWidthPreset = .border3
        animatedView.borderColor = Color.deepPurple.base
        
        animatedView.animate([.delay(1),
                              .duration(0.5),
                              .border(color: Color.cyan.base),
                              .border(width: BorderWidthPreset.border9.cgFloatValue * 2)]) { [weak self] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .border(color: Color.deepPurple.base),
                                                           .border(width: BorderWidthPreset.border3.cgFloatValue))
        }
    }
}

extension MagiNewsViewController {
    fileprivate func animateCornerRadius() {
        animatedView.animate(.delay(1),
                             MagiMotionAnimation.duration(0.5),
                             .corner(radius: 50),
                             .background(color: Color.cyan.base),
                             .completion({ [weak self] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .corner(radius: 0),
                                                           .background(color: Color.deepPurple.base))
                             }))
    }
}

extension MagiNewsViewController {
    /**
     The depth animation is made up of the following animations:
     
     .shadow(offset:)
     .shadow(opacity:)
     .shadow(radius:)
     */
    fileprivate func animateDepth() {
        animatedView.shapePreset = .circle
        animatedView.depthPreset = .depth5
        
        animatedView.animate(.delay(1),
                             .duration(0.5),
                             .depth(.none),
                             .background(color: Color.cyan.base),
                             .completion({ [weak self] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .depth(.depth5),
                                                           .background(color: Color.deepPurple.base))
                             }))
        
    }
}

extension MagiNewsViewController {
    fileprivate func animateFade() {
        animatedView.shapePreset = .circle
        
        animatedView.animate([.delay(1),
                              .duration(0.5),
                              .fadeOut,
                              .background(color: Color.cyan.base)]) { [weak self] in
                                
                                self?.animatedView.animate(.delay(1), .duration(0.5), .fadeIn, .background(color: Color.deepPurple.base))
        }
    }
}

extension MagiNewsViewController {
    fileprivate func animatePosition() {
        animatedView.shapePreset = .circle
        
        animatedView.animate(.delay(1),
                             .duration(0.5),
                             .position(CGPoint(x: 200, y: 200)),
                             .background(color: Color.cyan.base),
                             .completion({ [weak self, point = view.center] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .position(point),
                                                           .background(color: Color.deepPurple.base))
                             }))
    }
}

extension MagiNewsViewController {
    fileprivate func animateRotate() {
        animatedView.animate(.delay(1),
                             .duration(0.5),
                             .rotate(180),
                             .background(color: Color.cyan.base),
                             .completion({ [weak self] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .rotate(0),
                                                           .background(color: Color.deepPurple.base))
                             }))
    }
}

extension MagiNewsViewController {
    fileprivate func animateScale() {
        animatedView.shapePreset = .circle
        
        animatedView.animate(.delay(1),
                             .duration(0.5),
                             .scale(3),
                             .background(color: Color.cyan.base),
                             .completion({ [weak self] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .scale(),
                                                           .background(color: Color.deepPurple.base))
                             }))
    }
}

extension MagiNewsViewController {
    fileprivate func animateSize() {
        let size = animatedView.bounds.size
        
        animatedView.animate([.delay(1),
                              .duration(0.5),
                              .size(CGSize(width: 200, height: 200)),
                              .background(color: Color.cyan.base)]) { [weak self] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .size(size),
                                                           .background(color: Color.deepPurple.base))
        }
    }
}

extension MagiNewsViewController {
    fileprivate func animateSpin() {
        animatedView.animate([.delay(1),
                              .duration(0.5),
                              .spin(x: 1, y: 1, z: 1),
                              .background(color: Color.cyan.base)]) { [weak self] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .spin(-1),
                                                           .background(color: Color.deepPurple.base))
        }
    }
}

extension MagiNewsViewController {
    fileprivate func animateSpring() {
        let point = view.center
        
        animatedView.shapePreset = .circle
        
        animatedView.animate(.delay(1),
                             .position(CGPoint(x: 200, y: 200)),
                             .spring(stiffness: 15, damping: 2),
                             .background(color: Color.cyan.base),
                             .timingFunction(.linear),
                             .completion({ [weak self] in
                                
                                self?.animatedView.animate(.position(point),
                                                           .duration(0.5),
                                                           .background(color: Color.deepPurple.base))
                             }))
    }
}

extension MagiNewsViewController {
    fileprivate func animateTranslate() {
        animatedView.shapePreset = .circle
        
        animatedView.animate([.delay(1),
                              .duration(0.5),
                              .translate(x: 50, y: 100),
                              .background(color: Color.cyan.base)]) { [weak self] in
                                
                                self?.animatedView.animate(.delay(1),
                                                           .duration(0.5),
                                                           .translate(.zero),
                                                           .background(color: Color.deepPurple.base))
        }
    }
}

