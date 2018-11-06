//
//  SettingsCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

final class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: SettingsModuleFactory
    private let router: Router
    
    init(router: Router, factory: SettingsModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    deinit {
        deinitPrintLog()
    }
    
    override func start() {
        showSettings()
    }
    
    //MARK: - Run current flow's controllers
    private func showSettings() {
        let settingsFlowOutput = factory.makeSettingsOutput()
        router.setRootModule(settingsFlowOutput, hideBar: true)
    }
}
