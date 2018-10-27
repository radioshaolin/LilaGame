//
//  OnboardingCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

class OnboardingCoordinator: BaseCoordinator, OnboardingCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: OnboardingModuleFactory
    private let router: Router
    
    init(with factory: OnboardingModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    deinit {
        deinitLogger()
    }
    
    override func start() {
        showOnboarding()
    }
    
    func showOnboarding() {
        let onboardingModule = factory.makeOnboardingModule()
        onboardingModule.onFinish = { [weak self] in
            self?.finishFlow?()
        }
        router.setRootModule(onboardingModule.toPresent())
    }
}
