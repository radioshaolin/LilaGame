//
//  OnboardingCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

final class OnboardingCoordinator: BaseCoordinator, OnboardingCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let factory: OnboardingModuleFactory
    
    init(router: Router, factory: OnboardingModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    deinit {
        deinitPrintLog()
    }
    
    override func start() {
        showOnboarding()
    }
    
    func showOnboarding() {
        let onboardingModule = factory.makeOnboardingModule()
        onboardingModule.onFinish = { [weak self] in
            self?.finishFlow?()
        }
        router.push(onboardingModule, animated: true, completion: nil)
    }
}
