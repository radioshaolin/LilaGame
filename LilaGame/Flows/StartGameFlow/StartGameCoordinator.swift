//
//  JoinGameCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

final class StartGameCoordinator: BaseCoordinator, StartGameCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: JoinGameModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, factory: JoinGameModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    deinit {
        let selfName = String(describing: self)
        print("::\(selfName):: is deinited")
    }
    
    override func start() {
        showJoinGame()
    }
    
    //MARK: - Run current flow's controllers
    
    private func showJoinGame() {
        let joinGameOutput = factory.makeJoinGameOutput()
//        joinGameOutput.onCompleteJoinGame = { [weak self] item in
//            self?.finishFlow?()
//        }
        router.setRootModule(joinGameOutput, hideBar: true)
    }
    
    
    //MARK: - Run coordinators (switch to another flow)
    private func runGameFlow() {
//        let (coordinator, module) = coordinatorFactory.makeGameCoordinatorBox()
//        coordinator.finishFlow = { [weak self, weak coordinator] item in
//
//            self?.router.dismissModule()
//            self?.removeDependency(coordinator)
//            if let item = item {
//                self?.showItemDetail(item)
//            }
//        }
//        addDependency(coordinator)
//        router.present(module)
//        coordinator.start()
    }
}
