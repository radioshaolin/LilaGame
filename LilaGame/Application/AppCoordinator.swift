//
//  AppCoordinator.swift
//  LilaGame
//
//  Created by Ivan Zemlyaniy on 10/24/18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

private var onboardingWasShown = false
private var isAutorized = true

private enum LaunchInstructor {
    case main, auth, onboarding
    
    static func configure(
        tutorialWasShown: Bool = onboardingWasShown,
        isAutorized: Bool = isAutorized) -> LaunchInstructor {
        
        switch (tutorialWasShown, isAutorized) {
        case (false, _): return .onboarding
        case (true, false): return .auth
        case (true, true): return .main
        }
    }
}

// The coordinator and its children create a composite pattern
// From here it would be easy to make an iterator of the children
// Or use chain of responsibility to bubble up errors
final class AppCoordinator: Coordinator<DeepLink>, UITabBarControllerDelegate  {
    
    private let tabBarController = UITabBarController()
    private var tabs: [UIViewController: Coordinator<DeepLink>] = [:]
    private let coordinatorFactory: CoordinatorFactory
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    lazy var gameTabCoordinator: Coordinator<DeepLink> = {
        return coordinatorFactory.makeGameCoordinator()
    }()
    
    lazy var settingsTabCoordinator: Coordinator<DeepLink> = {
        return coordinatorFactory.makeSettingsCoordinator()
    }()
    
    
    init(router: RouterType, coordinatorFactory: CoordinatorFactory) {
        self.coordinatorFactory = coordinatorFactory
        super.init(router: router)
        router.setRootModule(tabBarController, hideBar: true)
        tabBarController.delegate = self
        setTabs([gameTabCoordinator, settingsTabCoordinator])
    }
    
    deinit {
        deinitPrintLog()
    }
    
    override func start(with option: DeepLink?) {
        //start with deepLink
        guard let option = option else { return }
        switch option {
            case .onboarding: runOnboardingFlow()
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            default: break
        }
//        if let option = option {
//            switch option {
//            case .onboarding: runOnboardingFlow()
//            default: childCoordinators.forEach { coordinator in
//                coordinator.start(with: option)
//                }
//            }
//            // default start
//        } else {
//            switch instructor {
//                case .onboarding: runOnboardingFlow()
//                case .auth: runAuthFlow()
//                case .main: runMainFlow()
//            }
//        }
    }
    
    private func runOnboardingFlow() {
//        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
//        coordinator.finishFlow = { [weak self, weak coordinator] in
//            isAutorized = true
//            self?.start()
//            self?.removeDependency(coordinator)
//        }
//        addChild(coordinator)
//        coordinator.start()
    }
    
    private func runAuthFlow() {
//        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router as! Router)
//        coordinator.finishFlow = { [weak self, weak coordinator] in
//            isAutorized = true
//            self?.start()
//            self?.removeDependency(coordinator)
//        }
//        addChild(coordinator)
//        coordinator.start()
    }
    
    
    
    private func runMainFlow() {
//        let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator(coordinatorFactory: coordinatorFactory)
//        addChild(coordinator)
//        router.setRootModule(module, hideBar: true)
//        coordinator.start()
    }
    
    private func setTabs(_ coordinators: [Coordinator<DeepLink>], animated: Bool = false) {
        tabs = [:]
        // Store view controller to coordinator mapping
        let vcs = coordinators.map { coordinator -> UIViewController in
            let viewController = coordinator.toPresentable()
            tabs[viewController] = coordinator
            return viewController
        }
        tabBarController.setViewControllers(vcs, animated: animated)
    }
    
    // MARK: UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let coordinator = tabs[viewController] else { return true }
        
        return true
        // Let's protect this tab because we can
//        if coordinator is AccountCoordinator && !store.isLoggedIn {
//            presentAuthFlow()
//            return false
//        } else {
//            return true
//        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    
}
