//
//  MainCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

class MainCoordinator: BaseCoordinator {
    
    private let mainView: MainView
    private let coordinatorFactory: CoordinatorFactory
    
    init(mainView: MainView, coordinatorFactory: CoordinatorFactory) {
        self.mainView = mainView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        mainView.onJoinGameFlowSelect = runJoinGameFlow()
        mainView.onSettingsFlowSelect = runSettingsFlow()
    }
    
    private func runJoinGameFlow() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let itemCoordinator = self.coordinatorFactory.makeJoinGameCoordinatorBox(navController: navController)
                itemCoordinator.start()
                self.addDependency(itemCoordinator)
            }
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
}
