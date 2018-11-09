//
//  AppDelegate.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var moduleFactory: ModuleFactory = ModuleFactoryImpl()
    lazy var coordinatorFactory: CoordinatorFactory = CoordinatorFactoryImpl(moduleFactory: moduleFactory)
<<<<<<< HEAD
    lazy var appNavigationController: UINavigationController = UINavigationController()
    lazy var appRouter: Router = RouterImpl(navigationController: appNavigationController)
=======
    let mainNavigationController = MainNavigationController()
    lazy var appRouter: Router = RouterImpl(rootController: mainNavigationController)
>>>>>>> 33fd572374b8a323529e3bc1e766ab99eff25bc5
    lazy var appCoordinator: AppCoordinator = AppCoordinator(router: appRouter, coordinatorFactory: coordinatorFactory)

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // MARK: Window
        window = UIWindow(frame: UIScreen.main.bounds)
<<<<<<< HEAD
        window?.rootViewController = appCoordinator.toPresentable()
=======
>>>>>>> 33fd572374b8a323529e3bc1e766ab99eff25bc5
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        window?.rootViewController = mainNavigationController
//            appRouter.toPresentable()


        
        // or get notification from launch options and convert it to a deep link
//        let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
//        let deepLink = DeepLink.build(with: notification)
        let deepLink = DeepLink.main
//        appCoordinator.start(with: deepLink)
        return true
    }
    
    //MARK: Handle push notifications and deep links
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        let dict = userInfo as? [String: AnyObject]
        let deepLink = DeepLink.build(with: dict)
        appCoordinator.start(with: deepLink)
    }
    
    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        let deepLink = DeepLink.build(with: userActivity)
        appCoordinator.start(with: deepLink)
        return true
    }
}


func delay(delay: Double, closure: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}
