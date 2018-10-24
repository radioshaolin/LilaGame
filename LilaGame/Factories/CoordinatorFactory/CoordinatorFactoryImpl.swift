//
//  CoordinatorFactoryImpl.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class CoordinatorFactoryImpl: CoordinatorFactory {
    
    func makeMainCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
        let controller = MainController.controllerFromStoryboard(.main)
        let coordinator = MainCoordinator(mainView: controller,
                                          coordinatorFactory: CoordinatorFactoryImpl())
        return (coordinator, controller)
    }
    
    func makeJoinGameCoordinatorBox() -> (configurator: Coordinator & JoinGameCoordinatorOutput,
        toPresent: Presentable?) {
       return makeJoinGameCoordinatorBox(navController: navigationController(nil))
    }
    
    func makeJoinGameCoordinatorBox(navController: UINavigationController?) -> (configurator: Coordinator & JoinGameCoordinatorOutput,
        toPresent: Presentable?) {
        let router = self.router(navController)
        let coordinator = JoinGameCoordinator(router: router,
                                              factory: ModuleFactoryImpl(),
                                              coordinatorFactory: CoordinatorFactoryImpl())
        return (coordinator, router)
    }
    
    func makeGameCoordinatorBox() -> (configurator: Coordinator & GameCoordinatorOutput,
        toPresent: Presentable?) {
        return makeGameCoordinatorBox(navController: navigationController(nil))
    }
    
    func makeGameCoordinatorBox(navController: UINavigationController?) -> (configurator: Coordinator & GameCoordinatorOutput,
        toPresent: Presentable?) {
        let router = self.router(navController)
        let coordinator = GameCoordinator(router: router, factory: ModuleFactoryImpl())
        return (coordinator, router)
    }
    
    

    
    func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput {
        let coordinator = AuthCoordinator(router: router,
                                          factory: ModuleFactoryImpl())
        return coordinator
    }
    
    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput {
        return OnboardingCoordinator(with: ModuleFactoryImpl(), router: router)
    }
    
    func makeSettingsCoordinator() -> Coordinator {
        return makeSettingsCoordinator(navController: nil)
    }
    
    func makeSettingsCoordinator(navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = SettingsCoordinator(router: router(navController),
                                              factory: ModuleFactoryImpl())
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
