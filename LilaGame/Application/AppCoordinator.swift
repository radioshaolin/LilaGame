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
final class AppCoordinator: BaseCoordinator  {
    

    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
//
//    lazy var gameTabCoordinator: Coordinator<DeepLink> = {
//        return coordinatorFactory.makeGameCoordinator()
//    }()
//
//    lazy var settingsTabCoordinator: Coordinator<DeepLink> = {
//        return coordinatorFactory.makeSettingsCoordinator()
//    }()
    
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
//        router.setRootModule(tabBarController, hideBar: true)
//        tabBarController.delegate = self
//        setTabs([gameTabCoordinator, settingsTabCoordinator])
    }
    
    deinit {
        deinitPrintLog()
    }
    
    override func start(with option: DeepLink?) {
        //start with deepLink
//        guard let option = option else { return }
//        switch option {
//            case .onboarding: runOnboardingFlow()
//            case .auth: runAuthFlow()
//            case .main: runMainFlow()
//            default: break
//        }
        if let option = option {
            switch option {
            case .onboarding: runOnboardingFlow()
            default: childCoordinators.forEach { coordinator in
                coordinator.start(with: option)
                }
            }
            // default start
        } else {
            switch instructor {
                case .onboarding: runOnboardingFlow()
                case .auth: runAuthFlow()
                case .main: runMainFlow()
            }
        }
    }
    
    private func runOnboardingFlow() {
        let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            onboardingWasShown = true
            self?.start()
            self?.removeChild(coordinator)
        }
        addChild(coordinator)
        coordinator.start()
    }
    
    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router as! Router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            isAutorized = true
            self?.start()
            self?.removeChild(coordinator)
        }
        addChild(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
        let (coordinator, tabBarController) = coordinatorFactory.makeTabbarCoordinator(router: router,
                                                                                       coordinatorFactory: coordinatorFactory)
        addChild(coordinator)
        router.setRootModule(tabBarController, hideBar: true)
        coordinator.start()
    }
}
