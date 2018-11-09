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

    func makeTabbarCoordinator(coordinatorFactory: CoordinatorFactory) -> (coordinator: Coordinator, toPresent: Presentable) {
        let controller = TabBarController.controllerFromStoryboard(.main)
        let coordinator = TabBarCoordinator(tabbarView: controller, coordinatorFactory: coordinatorFactory)
        return (coordinator, controller)
    }
    
    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput {
        return OnboardingCoordinator(router: router, factory: moduleFactory)
    }

    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput {
        return AuthCoordinator(router: router, factory: moduleFactory)

    }
    
    func makeSettingsCoordinator() -> Coordinator {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        let router = RouterImpl(navigationController: navigationController)
        let coordinator = SettingsCoordinator(router: router, factory: moduleFactory)
        return coordinator
    }


    func makeGameCoordinator() -> Coordinator {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        let router = RouterImpl(navigationController: navigationController)
        let coordinator = GameCoordinator(router: router, factory: moduleFactory)
        return coordinator
    }
    
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImpl(navigationController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }
}
