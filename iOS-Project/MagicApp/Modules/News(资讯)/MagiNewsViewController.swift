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
    
    fileprivate lazy var tableView: UITableView = { [weak self] in
        let _tableView = UITableView(frame: view.bounds,
                                     style: .plain)
        _tableView.rowHeight = 100
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.separatorColor = UIColor.purple
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        _tableView.register(UITableViewCell.self,
                            forCellReuseIdentifier: MagiNewsViewController.identifier)
        return _tableView
        }()
    
    // MARK: - 属性
    
    fileprivate static let identifier = "CellID"
    
    // MARK: - 系统方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 自定义方法
    
    private func setupUI() {
        view.addSubview(tableView)
    }
    
}

// MARK: - UITableViewDataSource
extension MagiNewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MagiNewsViewController.identifier,
                                                 for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = String(describing: indexPath.row)
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension MagiNewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       MagiProgressHUD.initMagiProgressHUD()
        MagiProgressHUD.showProgress("正在加载",0.5)
    }
    
}
