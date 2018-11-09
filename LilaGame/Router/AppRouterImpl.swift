//
//  AppRouterImpl.swift
//  LilaGame
//
//  Created by Ivan Zemlyaniy on 11/7/18.
//  Copyright (c) 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class AppRouterImpl: NSObject, Router, UITabBarControllerDelegate, Loggable {

    private let rootController: UITabBarController
    private let navigationController = UINavigationController()
    private var completions: [UIViewController : () -> Void]

    init(rootController: UITabBarController) {
        self.rootController = rootController
        self.completions = [:]
        super.init()
        self.rootController.delegate = self
    }

    deinit {
        deinitPrintLog()
    }

    public func present(_ module: Presentable, animated: Bool = true) {
        rootController.present(module.toPresentable(),
                               animated: animated,
                               completion: nil)
    }

    public func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootController.dismiss(animated: animated, completion: completion)
    }

    public func push(_ module: Presentable,
                     animated: Bool = true,
                     completion: (() -> Void)? = nil) {

        let controller = module.toPresentable()
        // Avoid pushing UINavigationController onto stack
        guard controller is UINavigationController == false else { return }
        if let completion = completion {
            completions[controller] = completion
        }
        navigationController.pushViewController(controller, animated: animated)
//        rootController.present
    }

    public func popModule(animated: Bool = true)  {
//        if let controller = rootController.popViewController(animated: animated) {
//            runCompletion(for: controller)
//        }
    }

    public func setRootModule(_ module: Presentable, hideBar: Bool = false) {
        // Call all completions so all coordinators can be deallocated
        completions.forEach { $0.value() }
        rootController.setViewControllers([module.toPresentable()], animated: false)
    }

    public func popToRootModule(animated: Bool) {
//        if let controllers = rootController.popToRootViewController(animated: animated) {
//            controllers.forEach { runCompletion(for: $0) }
//        }
    }

    fileprivate func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }

    // MARK: Presentable
    public func toPresentable() -> UIViewController {
        return rootController
    }

}
