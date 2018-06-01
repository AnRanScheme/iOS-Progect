//
//  AppDelegate.swift
//  MagicApp
//
//  Created by 安然 on 2017/11/2.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        window?.rootViewController = MagiTabBarController()
        // MagiProgressHUD.initMagiProgressHUD()
        
        return true
    }

    /// 当应用程序即将从活动状态转移到非活动状态时发送。
    /// 对于某些类型的临时中断（例如来电或SMS消息）或用户退出应用程序并开始转换到后台状态时，可能会发生这种情况。
    /// 使用此方法暂停正在进行的任务，禁用定时器，并使图形呈现回调无效。
    /// 游戏应该使用这种方法来暂停游戏。
    ///
    /// - Parameter application:
    func applicationWillResignActive(_ application: UIApplication) {

    }

    /// 使用此方法释放共享资源，保存用户数据，使计时器无效，
    /// 并存储足够的应用程序状态信息，以便将应用程序还原到当前状态，以防以后终止。
    /// 如果您的应用程序支持后台执行，则调用此方法而不是applicationWillTerminate：当用户退出时。
    ///
    /// - Parameter application:
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    /// 被称为从背景到活动状态的转换的一部分; 在这里你可以撤消进入背景的许多变化。
    ///
    /// - Parameter application:
    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    /// 在应用程序处于非活动状态时，重新启动暂停（或尚未启动）的任何任务。
    /// 如果应用程序以前位于后台，则可以选择刷新用户界面。
    ///
    /// - Parameter application:
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    /// 在应用程序即将终止时调用。
    /// 保存数据，如果适用。 另请参阅applicationDidEnterBackground :.
    /// 在应用程序终止之前，保存应用程序托管对象上下文中的更改。
    ///
    /// - Parameter application:
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "MagicApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }
            
            catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

