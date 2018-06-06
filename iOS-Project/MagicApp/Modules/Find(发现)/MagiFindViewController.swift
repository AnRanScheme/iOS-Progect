//
//  MagiFindViewController.swift
//  MagicApp
//
//  Created by 安然 on 2017/11/3.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import UIKit

class MagiFindViewController: MagiBaseViewController {

    // MARK: - 控件
    let chips = ChipBar()
    // MARK: - 属性
    
    // MARK: - 系统方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        prepareChips()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
fileprivate extension MagiFindViewController {
    func prepareChips() {
        let c1 = ChipItem(title: "Chip 1")
        c1.backgroundColor = Color.blue.base
        c1.titleColor = .white
        c1.pulseColor = .white
        c1.addTarget(self,
                     action: #selector(pushFABMenu),
                     for: .touchUpInside)
        
        let c2 = ChipItem(title: "Chip 2")
        c2.backgroundColor = Color.blue.base
        c2.titleColor = .white
        c2.pulseColor = .white
        c2.addTarget(self,
                     action: #selector(pushFABMenu1),
                     for: .touchUpInside)
        
        
        let c3 = ChipItem(title: "Chip 3")
        c3.backgroundColor = Color.blue.base
        c3.titleColor = .white
        c3.pulseColor = .white
        
        let c4 = ChipItem(title: "Chip 4")
        c4.backgroundColor = Color.blue.base
        c4.titleColor = .white
        c4.pulseColor = .white
        
        let c5 = ChipItem(title: "Chip 5")
        c5.backgroundColor = Color.blue.base
        c5.titleColor = .white
        c5.pulseColor = .white
        
        let c6 = ChipItem(title: "Chip 6")
        c6.backgroundColor = Color.blue.base
        c6.titleColor = .white
        c6.pulseColor = .white
        
        let c7 = ChipItem(title: "Chip 7")
        c7.backgroundColor = Color.blue.base
        c7.titleColor = .white
        c7.pulseColor = .white
        
        let c8 = ChipItem(title: "Chip 8")
        c8.backgroundColor = Color.blue.base
        c8.titleColor = .white
        c8.pulseColor = .white
        
        let c9 = ChipItem(title: "Chip 9")
        c9.backgroundColor = Color.blue.base
        c9.titleColor = .white
        c9.pulseColor = .white
        
        chips.chipItems = [c1, c2, c3, c4, c5, c6, c7, c8, c9]
        
        view.layout(chips).top(64).left().right()
    }
}

fileprivate extension MagiFindViewController {
    @objc
    func pushFABMenu() {
        let vc = AppFABMenuController(rootViewController: OrangeViewController())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func pushFABMenu1() {
        let vc = IdentifiterOrangeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

