//
//  MainCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class TabBarCoordinator: BaseCoordinator, UITabBarControllerDelegate {
    
    private let tabBarView: TabBarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabBarView, coordinatorFactory: CoordinatorFactory) {
        self.tabBarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabBarView.onViewDidLoad = runGameFlow()
        tabBarView.onGameFlowSelect = runGameFlow()
        tabBarView.onSettingsFlowSelect = runSettingsFlow()
    }
    
    private func runGameFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navigationController in
            guard let strongSelf = self, navigationController.viewControllers.isEmpty else { return }
            let gameCoordinator = strongSelf.coordinatorFactory.makeGameCoordinator()
            strongSelf.addDependency(gameCoordinator)
            gameCoordinator.start()
        }
    }
    
    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navigationController in
            guard let strongSelf = self, navigationController.viewControllers.isEmpty else { return }
            let settingsCoordinator = strongSelf.coordinatorFactory.makeSettingsCoordinator()
            settingsCoordinator.start()
            strongSelf.addDependency(settingsCoordinator)
            settingsCoordinator.start()
        }
    }
}

