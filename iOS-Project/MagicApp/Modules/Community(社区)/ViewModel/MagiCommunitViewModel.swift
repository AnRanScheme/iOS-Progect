//
//  MagiCommunitViewModel.swift
//  MagicApp
//
//  Created by 安然 on 2018/1/17.
//  Copyright © 2018年 MacBook. All rights reserved.
//

import UIKit

class MagiCommunitViewModel {
    
    func setData()->[MagiCommunitModel]? {
        
        let title = "测试辩题"
        let subTitle = "测试子标题一定要长度啥都好说weweweweweweweの43充电电池 "
        let content = "内容一定要倡导撒打dsdssdsdsds算大所酒店还是酒店还是酒店还是酒店还是sdsdsdsds"
        let imageString = "http://g.hiphotos.baidu.com/lvpics/w=1000/sign=1be9ee3b2f34349b74066a85f9da14ce/3801213fb80e7bec6a230cc0282eb9389b506b11.jpg"
        
        var dataArray: [MagiCommunitModel] = [MagiCommunitModel]()
        
        for index in 1...90 {
            let model = MagiCommunitModel()
            model.title = title + String(index)
            var contentData = ""
            
            if index % 3 == 0 {
                contentData = content + content
            }
            
            else if index % 3 == 1 {
                contentData = content + content + content
            }
                
            else {
                contentData = content
            }
            
            model.content = contentData
            model.subTitle = subTitle + String(index)
            model.imageString = imageString
            dataArray.append(model)
        }
        return dataArray
    }

}
