//
//  CoordinatorFactoryImpl.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class CoordinatorFactoryImpl: CoordinatorFactory {
    
    let moduleFactory = ModuleFactoryImpl()
    
//    func makeTabbarCoordinator(coordinatorFactory: CoordinatorFactory) -> (coordinator: Coordinator<DeepLink>, toPresent: Presentable) {
//        let controller = TabbarController.controllerFromStoryboard(.main)
//        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: coordinatorFactory)
//        return (coordinator, controller)
//    }

//
//    func makeOnboardingCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & OnboardingCoordinatorOutput, toPresentable: Presentable) {
//
//    }
//
//    func makeAuthCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & AuthCoordinatorOutput, toPresentable: Presentable) {
//
//    }
    
    func makeSettingsCoordinator() -> Coordinator<DeepLink> {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let router = Router(navigationController: navigationController)
        let coordinator = SettingsCoordinator(router: router, factory: moduleFactory)
        return coordinator
    }


    func makeGameCoordinator() -> Coordinator<DeepLink> {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        let router = Router(navigationController: navigationController)
        let coordinator = GameCoordinator(router: router, factory: moduleFactory)
        return coordinator
    }
    
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }
}
