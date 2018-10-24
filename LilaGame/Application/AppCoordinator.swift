//
//  AppCoordinator.swift
//  LilaGame
//
//  Created by Ivan Zemlyaniy on 10/24/18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

private var onboardingWasShown = false

fileprivate enum LaunchInstructor {
    case main, onboarding
    
    static func configure(tutorialWasShown: Bool = onboardingWasShown) -> LaunchInstructor {
        return tutorialWasShown ? .main : .onboarding
    }
}

final class ApplicationCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    deinit {
        let selfName = String(describing: type(of: self))
        print("::\(selfName):: is deinited")
    }
    
    override func start(with option: DeepLinkOption?) {
        //start with deepLink
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
            case .main: runMainFlow()
            }
        }
    }
    
    private func runOnboardingFlow() {
        let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            onboardingWasShown = true
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
        let (coordinator, module) = coordinatorFactory.makeMainCoordinator()
        addDependency(coordinator)
        router.setRootModule(module, hideBar: true)
        coordinator.start()
    }
}

