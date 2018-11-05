//
//  MainCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit


class TabbarCoordinator: Coordinator<DeepLink>, UITabBarControllerDelegate {
    
    private let tabbarView: TabbarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarView.onViewDidLoad = runJoinGameFlow()
        tabbarView.onJoinGameFlowSelect = runJoinGameFlow()
        tabbarView.onSettingsFlowSelect = runSettingsFlow()
    }
    
    private func runJoinGameFlow() -> ((UINavigationController) -> ()) {
        return { navigationController in
            guard navigationController.viewControllers.isEmpty else { return }
            let (joinGameCoordinator, router) = self.coordinatorFactory.makeStartGameCoordinator(router: <#T##Router#>)
            self.addChild(joinGameCoordinator)
            joinGameCoordinator.start()
        }
    }
    
    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
                settingsCoordinator.start()
                self.addDependency(settingsCoordinator)
            }
        }
    }
    
    
    
    // MARK: UITabBarControllerDelegate
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //    guard let coordinator = tabs[viewController] else { return true }
        //
        //    // Let's protect this tab because we can
        //    if coordinator is AccountCoordinator && !store.isLoggedIn {
        //        presentAuthFlow()
        //        return false
        //    } else {
        //        return true
        //    }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    
}


//class MainCoordinator: Coordinator<DeepLink> {
//
//    private let mainView: MainView
//    private let coordinatorFactory: CoordinatorFactory
//
//    init(mainView: MainView, coordinatorFactory: CoordinatorFactory) {
//        self.mainView = mainView
//        self.coordinatorFactory = coordinatorFactory
//    }
//
//    deinit {
//        deinitPrintLog()
//    }
//
//    override func start() {
//        mainView.onJoinGameFlowSelect = runJoinGameFlow()
//        mainView.onSettingsFlowSelect = runSettingsFlow()
//    }
//
//    private func runJoinGameFlow() -> ((UINavigationController) -> ()) {
//        return { navController in
//            if navController.viewControllers.isEmpty == true {
//                let itemCoordinator = self.coordinatorFactory.makeJoinGameCoordinatorBox(navController: navController)
//                itemCoordinator.start()
//                self.addDependency(itemCoordinator)
//            }
//        }
//    }
//
//    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
//        return { navController in
//            if navController.viewControllers.isEmpty == true {
//                let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
//                settingsCoordinator.start()
//                self.addDependency(settingsCoordinator)
//            }
//        }
//    }
//}

