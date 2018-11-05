//
//  CoordinatorFactoryImpl.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class CoordinatorFactoryImpl: CoordinatorFactory {
    
    func makeTabbarCoordinator(coordinatorFactory: CoordinatorFactory) -> (coordinator: Coordinator<DeepLink>, toPresent: Presentable) {
        let controller = TabbarController.controllerFromStoryboard(.main)
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: coordinatorFactory)
        return (coordinator, controller)
    }

    
    func makeOnboardingCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & OnboardingCoordinatorOutput, toPresentable: Presentable) {
        
    }
    
    func makeAuthCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & AuthCoordinatorOutput, toPresentable: Presentable) {
        
    }
    
    func makeSettingsCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & SettingsCoordinatorOutput, toPresentable: Presentable?) {
        
    }

//
//    func makeJoinGameCoordinatorBox() -> (coordinator: Coordinator<DeepLink> & JoinGameCoordinatorOutput,
//        toPresent: Presentable?) {
//       return makeJoinGameCoordinatorBox(navController: navigationController(nil))
//    }
    
    func makeStartGameCoordinator(router: RouterType) -> (configurator: Coordinator<DeepLink> & StartGameCoordinatorOutput,
        toPresent: Presentable?) {
        let router = Router(navigationController: navigationController)
        let coordinator = StartGameCoordinator(router: router,
                                              factory: ModuleFactoryImpl(),
                                              coordinatorFactory: CoordinatorFactoryImpl())
        return (coordinator, router)
    }
    
//    func makeGameCoordinatorBox() -> (configurator: Coordinator & GameCoordinatorOutput,
//        toPresent: Presentable?) {
//        return makeGameCoordinatorBox(navController: navigationController(nil))
//    }
//    
//    func makeGameCoordinatorBox(navController: UINavigationController?) -> (configurator: Coordinator<DeepLink> & GameCoordinatorOutput,
//        toPresent: Presentable?) {
//        let router = self.router(navController)
//        let coordinator = GameCoordinator(router: router, factory: ModuleFactoryImpl())
//        return (coordinator, router)
//    }
    
//    func makeAuthCoordinatorBox(router: Router) -> Coordinator<DeepLink> & AuthCoordinatorOutput {
//        let coordinator = AuthCoordinator(router: router,
//                                          factory: ModuleFactoryImpl())
//        return coordinator
//    }
//
//    func makeOnboardingCoordinator(router: RouterType) -> Coordinator<DeepLink> & OnboardingCoordinatorOutput {
//        return OnboardingCoordinator(with: ModuleFactoryImpl(), router: router)
//    }
//
//    func makeSettingsCoordinator() -> Coordinator<DeepLink> {
//        return makeSettingsCoordinator(navController: nil)
//    }
//
//    func makeSettingsCoordinator(navController: UINavigationController? = nil) -> Coordinator<DeepLink> {
//        let coordinator = SettingsCoordinator(router: router(navController),
//                                              factory: ModuleFactoryImpl())
//        return coordinator
//    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }
}
