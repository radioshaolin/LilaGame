//
//  GameCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit


final class GameCoordinator: Coordinator<DeepLink> {
    
    var finishFlow: (() -> Void)?
    
    private let factory: GameModuleFactory
    
    init(router: Router, factory: GameModuleFactory) {
        self.factory = factory
        super.init(router: router)
    }
    
    override func start() {
        showCreate()
    }
    
    //MARK: - Run current flow's controllers
    
    private func showCreate() {
        let gameOuput = factory.makeGameOutput()
        gameOuput.onDidFinishGame = { [weak self] in
            self?.finishFlow?()
        }
        router.push(gameOuput, animated: true, completion: nil)
    }
}
