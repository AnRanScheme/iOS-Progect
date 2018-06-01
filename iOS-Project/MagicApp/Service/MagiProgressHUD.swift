//
//  MagiProgressHUD.swift
//  MagicApp
//
//  Created by 安然 on 2017/11/3.
//  Copyright © 2017年 MacBook. All rights reserved.
//


enum HUDType {
    case success
    case error
    case loading
    case info
    case progress
}

import SVProgressHUD


class MagiProgressHUD: NSObject {
    
    class func initMagiProgressHUD() {
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 14.0))
        SVProgressHUD.setDefaultMaskType(.none)
        SVProgressHUD.setMinimumDismissTimeInterval(1.5)
    }
    
    class func showSuccess(_ status: String) {
        self.showMagiProgressHUD(type: .success, status: status)
    }
 
    class func showError(_ status: String) {
        self.showMagiProgressHUD(type: .error, status: status)
    }
 
    class func showLoading(_ status: String) {
        self.showMagiProgressHUD(type: .loading, status: status)
    }
 
    class func showInfo(_ status: String) {
        self.showMagiProgressHUD(type: .info, status: status)
    }
 
    class func showProgress(_ status: String, _ progress: CGFloat) {
        self.showMagiProgressHUD(type: .progress, status: status, progress: progress)
    }
 
    class func dismissHUD(_ delay: TimeInterval = 0) {
        SVProgressHUD.dismiss(withDelay: delay)
    }
 
}


extension MagiProgressHUD {
    class func showMagiProgressHUD(type: HUDType, status: String, progress: CGFloat = 0) {
        switch type {
        case .success:
            SVProgressHUD.showSuccess(withStatus: status)
        case .error:
            SVProgressHUD.showError(withStatus: status)
        case .loading:
            SVProgressHUD.show(withStatus: status)
        case .info:
            SVProgressHUD.showInfo(withStatus: status)
        case .progress:
            SVProgressHUD.showProgress(Float(progress), status: status)
        }
    }
}

