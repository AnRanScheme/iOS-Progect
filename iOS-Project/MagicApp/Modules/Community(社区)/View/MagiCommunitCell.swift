//
//  MagiCommunitCell.swift
//  MagicApp
//
//  Created by 安然 on 2018/1/17.
//  Copyright © 2018年 MacBook. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class MagiCommunitCell: ASCellNode {

    // MARK: - 系统方法
    
    override init() {
        super.init()
        setupUI()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        imageNode.style.preferredSize = CGSize(width: 50, height: 50)
        imageNode.style.layoutPosition = CGPoint(x: 37, y: 30)
        
        let titleLocationStack = ASStackLayoutSpec.vertical()
        titleLocationStack.style.flexShrink = 2.0
        titleLocationStack.style.flexGrow = 1.0
        titleLocationStack.children = [titleNode, subTitleNode]
        
        let headerStackSpec = ASStackLayoutSpec(direction: ASStackLayoutDirection.horizontal,
                                                spacing: 12,
                                                justifyContent: ASStackLayoutJustifyContent.end,
                                                alignItems: ASStackLayoutAlignItems.center,
                                                children: [imageNode, titleLocationStack])
        
        let contentLocationStack = ASStackLayoutSpec.vertical()
        contentLocationStack.style.flexShrink = 2.0
        contentLocationStack.style.flexGrow = 1.0
        contentLocationStack.children = [headerStackSpec, contentNode]

        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10),
                                 child: contentLocationStack)
    }

    // MARK: - 自定义方法
    
    private func setupUI() {
        automaticallyManagesSubnodes = true
    }
    
    // MARK: - 属性
    
    var model: MagiCommunitModel? {
        didSet{

            if let title = model?.title {
                let attrs: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16),
                                                            NSAttributedStringKey.foregroundColor: UIColor.blue]
                let attributedText  = NSAttributedString(string: title,
                                                         attributes: attrs)
                
                titleNode.attributedText = attributedText
            }
            
            if let subTitle = model?.subTitle {
                let attrs: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
                                                            NSAttributedStringKey.foregroundColor: UIColor.red]
                let attributedText  = NSAttributedString(string: subTitle,
                                                         attributes: attrs)
                subTitleNode.attributedText = attributedText
            }

            
            if let content = model?.content {
                let attrs: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
                                                            NSAttributedStringKey.foregroundColor: UIColor.gray]
                let attributedText  = NSAttributedString(string: content,
                                                         attributes: attrs)
                contentNode.attributedText = attributedText
                
            }

            
            if let imageString = model?.imageString {
                let url = URL(string: imageString)
                imageNode.setURL(url, resetToDefault: true)
            }
            
        }
    }
    
    // MARK: - 控件
    
    lazy var titleNode: ASTextNode = {
        let titleNode = ASTextNode()
        titleNode.maximumNumberOfLines = 1
        return titleNode
    }()
    
    lazy var subTitleNode: ASTextNode = {
        let subTitleNode = ASTextNode()
        subTitleNode.maximumNumberOfLines = 1
        return subTitleNode
    }()
    
    lazy var contentNode: ASTextNode = {
        let titleNode = ASTextNode()
        titleNode.maximumNumberOfLines = 0
        return titleNode
    }()
    /*
    lazy var imageNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage(named: "1")
        imageNode.contentMode = .scaleAspectFill
        imageNode.cornerRadius = 25
        return imageNode
    }()
    */
    lazy var imageNode: ASNetworkImageNode = {
        let imageNode = ASNetworkImageNode()
        imageNode.defaultImage = UIImage(named: "1")
        imageNode.contentMode = .scaleAspectFill
        imageNode.cornerRadius = 25
        return imageNode
    }()
    

}
