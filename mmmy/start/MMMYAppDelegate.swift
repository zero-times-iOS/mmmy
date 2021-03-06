//
//  AppDelegate.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit
import Flurry_iOS_SDK
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // crash sdk 初始化
        Fabric.with([Crashlytics.self])
      
        // 统计初始化
        Flurry.startSession("VNDGP2259JW65W6N7P2B", with: FlurrySessionBuilder
            .init()
            .withCrashReporting(true)
            .withLogLevel(FlurryLogLevelAll))
        
        let rootViewController = LoadStoryBoardUntils.loadViewController(
            strings.storyBoard.launchStartMain,
            with: strings.vc.launchRegister)

//        let rootViewController = LoadStoryBoardUntils.loadViewController(
//            strings.storyBoard.ground,
//            with: strings.vc.mmmyTabbar)
        window?.rootViewController = rootViewController;
       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

