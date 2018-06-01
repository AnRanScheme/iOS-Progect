//
//  MagiHomeViewController.swift
//  MagicApp
//
//  Created by 安然 on 2017/11/3.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import UIKit
import MJRefresh

class MagiHomeViewController: MagiBaseViewController {
    
    // MARK: - 控件
    
    fileprivate lazy var tableView: UITableView = { [weak self] in
        let _tableView = UITableView(frame: view.bounds,
                                     style: .plain)
        _tableView.rowHeight      = 100
        _tableView.delegate       = self
        _tableView.dataSource     = self
        _tableView.separatorColor = UIColor.red
        _tableView.allowsSelection = false
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        _tableView.register(UITableViewCell.self,
                            forCellReuseIdentifier: MagiHomeViewController.identifier)
        return _tableView
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let _collectionView = UICollectionView(frame: CGRect.zero,
                                               collectionViewLayout: layout)
        return _collectionView
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
      
        
        let right = UIBarButtonItem(barButtonSystemItem: .add,
                                    target: self,
                                    action: #selector(pushToNewController))
        
        navigationItem.rightBarButtonItem = right
        
    }
    
    @objc fileprivate func pushToNewController() {
        let vc = MagiSearchViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension MagiHomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 23
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MagiHomeViewController.identifier,
                                                 for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = String(describing: indexPath.row)
        cell.backgroundColor = UIColor.green
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension MagiHomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.purple
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }

}
