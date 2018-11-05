//
//  Coordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    func start()
    func start(with link: DeepLink?)
}


class BaseCoordinator: NSObject, Coordinator, Loggable {
    
    var childCoordinators: [Coordinator] = []
    
    deinit {
        deinitPrintLog()
    }
    
    func start() {
        start(with: nil)
    }
    
    func start(with link: DeepLink?) { }
    
    // add only unique object
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
