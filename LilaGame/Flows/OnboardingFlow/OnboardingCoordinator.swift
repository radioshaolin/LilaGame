//
//  OnboardingCoordinator.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

final class OnboardingCoordinator: Coordinator<DeepLink>, OnboardingCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: OnboardingModuleFactory
    
    init(with factory: OnboardingModuleFactory, router: RouterType) {
        self.factory = factory
        self.router = router
    }
    
    deinit {
        deinitPrintLog()
    }
    
    override func start() {
        showOnboarding()
    }
    
    func showOnboarding() {
//        let onboardingModule = factory.makeOnboardingModule()
//        onboardingModule.onFinish = { [weak self] in
//            self?.finishFlow?()
//        }
//        router.setRootModule(onboardingModule.toPresent())
    }
}
