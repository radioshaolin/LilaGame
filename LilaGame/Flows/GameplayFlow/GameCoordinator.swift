//
//  GameCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit


final class GameCoordinator: Coordinator<DeepLink>, GameCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let factory: GameModuleFactory
    
    init(router: Router, factory: GameModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showCreate()
    }
    
    //MARK: - Run current flow's controllers
    
    private func showCreate() {
        let createGameOuput = factory.makeGameOutput()
        createGameOuput.onDidFinishGame = { [weak self] in
            self?.finishFlow?()
        }
        router.setRootModule(createGameOuput)
    }
}
