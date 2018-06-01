//
//  CenterViewController.swift
//  MagicApp
//
//  Created by 安然 on 2018/1/18.
//  Copyright © 2018年 MacBook. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        menuItem = MenuItem.sharedItems.first!
        view.addSubview(symbol)
        symbol.center = view.center
        /*
        view.addSubview(tableView)
        view.addSubview(text)
        view.backgroundColor = UIColor.lightGray
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc private func popAlert(_ tapges: UITapGestureRecognizer) {
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - 属性
    
    fileprivate static let identifier = "CellID"
    
    lazy var alert: UIAlertController = {
        
        let alert = UIAlertController(title: "你好",
                                      message: "你好",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField(configurationHandler: { (textField) in
            
        })
        let action = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { (action) in
            
        })
        
        let action1 = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: { (action) in
            
        })
        alert.addAction(action)
        alert.addAction(action1)
        return alert
    }()

    var menuItem: MenuItem = MenuItem.sharedItems.first! {
        didSet {
            title = menuItem.title
            view.backgroundColor = menuItem.color
            symbol.text = menuItem.symbol
        }
    }
    
    // MARK: - 控件
    
    lazy var menuButton: MenuButton = {
        let menuButton = MenuButton()
        menuButton.tapHandler = {
            if let containerVC = self.navigationController?.parent as? ContainerViewController {
                containerVC.toggleSideMenu()
            }
        }
        return menuButton
    }()
    
    lazy var symbol: UILabel = {
        let symbol = UILabel()
        symbol.text = "☎︎"
        symbol.textColor = UIColor.white
        symbol.font = UIFont.systemFont(ofSize: 48)
        symbol.isUserInteractionEnabled = true
        symbol.sizeToFit()
        let tapGes = UITapGestureRecognizer(target: self,
                                            action: #selector(popAlert(_:)))
        symbol.addGestureRecognizer(tapGes)
        return symbol
    }()
    
    // MARK: - 控件
    
    fileprivate lazy var tableView: TestTableView = {
        let _tableView = TestTableView(frame: view.bounds,
                                       style: .plain)
        _tableView.rowHeight      = 100
        _tableView.delegate       = self
        _tableView.dataSource     = self
        _tableView.separatorColor = UIColor.red
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        _tableView.register(UITableViewCell.self,
                            forCellReuseIdentifier: CenterViewController.identifier)
        return _tableView
    }()

}

// MARK: - UITableViewDataSource
extension CenterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 23
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CenterViewController.identifier,
                                                 for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = String(describing: indexPath.row)
        cell.backgroundColor = UIColor.green
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension CenterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.purple
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
}
