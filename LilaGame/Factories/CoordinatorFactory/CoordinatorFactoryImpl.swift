//
//  CoordinatorFactoryImpl.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class CoordinatorFactoryImpl: CoordinatorFactory {

    let moduleFactory: ModuleFactory
    
    init(moduleFactory: ModuleFactory) {
        self.moduleFactory = moduleFactory
    }
    
    deinit {
        deinitPrintLog()
    }

    func makeTabbarCoordinator(router: RouterType, coordinatorFactory: CoordinatorFactory) -> (coordinator: Coordinator<DeepLink>, toPresent: Presentable) {
        let controller = TabbarController.controllerFromStoryboard(.main)
        let coordinator = TabbarCoordinator(router: router, tabbarView: controller, coordinatorFactory: coordinatorFactory)
        return (coordinator, controller)
    }
    
    func makeOnboardingCoordinator(router: RouterType) -> Coordinator<DeepLink> & OnboardingCoordinatorOutput {
        return OnboardingCoordinator(router: router, factory: moduleFactory)
    }

    func makeAuthCoordinator(router: RouterType) -> Coordinator<DeepLink> & AuthCoordinatorOutput {
        return AuthCoordinator(router: router, factory: moduleFactory)

    }
    
    func makeSettingsCoordinator(with navigationController: UINavigationController? = nil) -> Coordinator<DeepLink> {
        let navigationController = navigationController ?? UINavigationController()
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let router = Router(navigationController: navigationController)
        let coordinator = SettingsCoordinator(router: router, factory: moduleFactory)
        return coordinator
    }


    func makeGameCoordinator(with navigationController: UINavigationController? = nil) -> Coordinator<DeepLink> {
        let navigationController = navigationController ?? UINavigationController()
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
