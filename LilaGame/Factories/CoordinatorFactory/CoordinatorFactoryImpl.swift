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
        let controller = TabbarController.controllerFromStoryboard(.main)
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: coordinatorFactory)
        return (coordinator, controller)
    }
    
    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput {
        return OnboardingCoordinator(router: router, factory: moduleFactory)
    }

    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput {
        return AuthCoordinator(router: router, factory: moduleFactory)

    }
    
    func makeSettingsCoordinator(with navigationController: UINavigationController) -> Coordinator {
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let router = RouterImpl(rootController: navigationController)
        let coordinator = SettingsCoordinator(router: router, factory: moduleFactory)
        return coordinator
    }


    func makeGameCoordinator(with navigationController: UINavigationController) -> Coordinator {
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        let router = RouterImpl(rootController: navigationController)
        let coordinator = GameCoordinator(router: router, factory: moduleFactory)
        return coordinator
    }
    
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImpl(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }
}
