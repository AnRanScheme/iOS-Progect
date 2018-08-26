//
//  MagiCommunityViewController.swift
//  MagicApp
//
//  Created by 安然 on 2017/11/3.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import SnapKit


class MagiCommunityViewController: MagiBaseViewController {

    // MARK: - 系统方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 自定义方法
    
    private func setUpUI() {
        view.addSubnode(tableNode)
        tableNode.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func loadData() {
        let viewModel = MagiCommunitViewModel()
        if let data = viewModel.setData() {
            dataArray = data
            tableNode.reloadData()
        }
    }
    
    // MARK: - 属性
    
    fileprivate lazy var dataArray: [MagiCommunitModel] = [MagiCommunitModel]()
    
    // MARK: - 控件
    
    lazy var tableNode: ASTableNode = {
        let _tableNode = ASTableNode()
        _tableNode.delegate = self
        _tableNode.dataSource = self
        _tableNode.view.tableFooterView = UIView()
        return _tableNode
    }()

}

extension MagiCommunityViewController: ASTableDataSource {
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let cell =  MagiCommunitCell()
        cell.model = dataArray[indexPath.row]
        return cell
    }
    
}

extension MagiCommunityViewController: ASTableDelegate {
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.classForCoder
        guard let vcs = tabBarController?.childViewControllers else{ return }
        
        for objc in vcs {
            
            if objc.isKind(of: vc) {
                print("进入")
            }
                
            else {
                print("进不去")
            }
        }
    }
}






