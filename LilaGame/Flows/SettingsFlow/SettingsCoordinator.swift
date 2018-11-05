//
//  SettingsCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

final class SettingsCoordinator: Coordinator<DeepLink>, SettingsCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: SettingsModuleFactory
    
    init(router: RouterType, factory: SettingsModuleFactory) {
        self.factory = factory
        super.init(router: router)
    }
    
    deinit {
        deinitPrintLog()
    }
    
    override func start() {
        showSettings()
    }
    
    //MARK: - Run current flow's controllers
    private func showSettings() {
//        let settingsFlowOutput = factory.makeSettingsOutput()
//        router.setRootModule(settingsFlowOutput, hideBar: true)
    }
}
