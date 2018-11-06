//
//  MainCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class TabbarCoordinator: BaseCoordinator, UITabBarControllerDelegate {
    
    private let tabbarView: TabbarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarView.onViewDidLoad = runGameFlow()
        tabbarView.onGameFlowSelect = runGameFlow()
        tabbarView.onSettingsFlowSelect = runSettingsFlow()
    }
    
    private func runGameFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navigationController in
            guard let strongSelf = self, navigationController.viewControllers.isEmpty else { return }
            let gameCoordinator = strongSelf.coordinatorFactory.makeGameCoordinator(with: navigationController)
            strongSelf.addDependency(gameCoordinator)
            gameCoordinator.start()
        }
    }
    
    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
        return { [weak self] navigationController in
            guard let strongSelf = self, navigationController.viewControllers.isEmpty else { return }
            let settingsCoordinator = strongSelf.coordinatorFactory.makeSettingsCoordinator(with: navigationController)
            settingsCoordinator.start()
            strongSelf.addDependency(settingsCoordinator)
            settingsCoordinator.start()
        }
    }
}

