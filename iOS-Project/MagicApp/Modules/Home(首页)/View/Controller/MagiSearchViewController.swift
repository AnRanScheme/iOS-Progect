//
//  MagiSearchViewController.swift
//  MagicApp
//
//  Created by 安然 on 2017/12/29.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import UIKit

class MagiSearchViewController: UIViewController {
    
    lazy var searchViewController: UISearchController = {
        let vc = UISearchController()
        vc.searchBar.becomeFirstResponder()
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
