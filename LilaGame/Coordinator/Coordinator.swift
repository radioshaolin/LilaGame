//
//  Coordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

public protocol BaseCoordinatorType: class {
    associatedtype DeepLinkType
    func start()
    func start(with link: DeepLinkType?)
}

public protocol PresentableCoordinatorType: BaseCoordinatorType, Presentable { }

public protocol CoordinatorType: PresentableCoordinatorType {
    var router: RouterType { get }
}

open class PresentableCoordinator<DeepLinkType>: NSObject, PresentableCoordinatorType, Loggable {
    
    public override init() {
        super.init()
    }
    
    deinit {
        deinitPrintLog()
    }
    
    open func start() { start(with: nil) }
    open func start(with link: DeepLinkType?) { fatalError("Must override") }
    
    open func toPresentable() -> UIViewController {
        fatalError("Must override toPresentable()")
    }
}

open class Coordinator<DeepLinkType>: PresentableCoordinator<DeepLinkType>, CoordinatorType  {
    
    public var childCoordinators: [Coordinator<DeepLinkType>] = []
    
    open var router: RouterType
    
    public init(router: RouterType) {
        self.router = router
        super.init()
    }
    
    deinit {
        deinitPrintLog()
    }
    public func addChild(_ coordinator: Coordinator<DeepLinkType>) {
                for element in childCoordinators {
                    if element === coordinator { return }
                }
                childCoordinators.append(coordinator)
    }
    
    public func removeChild(_ coordinator: Coordinator<DeepLinkType>?) {
        guard let coordinator = coordinator, childCoordinators.isEmpty == false else { return }
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    open override func toPresentable() -> UIViewController {
        return router.toPresentable()
    }
}





//protocol Coordinator: class {
//
//    func start()
//    func start(with option: DeepLinkOption?)
//}
//
//public protocol BaseCoordinatorType: class {
//    associatedtype DeepLinkType
//    func start()
//    func start(with link: DeepLinkType?)
//}
//
//class BaseCoordinator: Coordinator {
//
//    var childCoordinators: [Coordinator] = []
//
//    func start() {
//        start(with: nil)
//    }
//
//    func start(with option: DeepLinkOption?) { }
//
//    // add only unique object
//    func addDependency(_ coordinator: Coordinator) {
//        for element in childCoordinators {
//            if element === coordinator { return }
//        }
//        childCoordinators.append(coordinator)
//    }
//
//    func removeDependency(_ coordinator: Coordinator?) {
//        guard
//            childCoordinators.isEmpty == false,
//            let coordinator = coordinator
//            else { return }
//
//        for (index, element) in childCoordinators.enumerated() {
//            if element === coordinator {
//                childCoordinators.remove(at: index)
//                break
//            }
//        }
//    }
//}
//
//extension Coordinator {
//    func deinitLogger() {
//        let selfName = String(describing: self)
//        print("=== \(selfName) === is deinited")
//    }
//}
