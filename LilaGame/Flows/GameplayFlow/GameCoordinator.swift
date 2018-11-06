//
//  GameCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit


final class GameCoordinator: BaseCoordinator {
    
    var finishFlow: (() -> Void)?
    
    private let factory: GameModuleFactory
    private let router: Router
    
    init(router: Router, factory: GameModuleFactory) {
        self.router = router
        self.factory = factory
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
