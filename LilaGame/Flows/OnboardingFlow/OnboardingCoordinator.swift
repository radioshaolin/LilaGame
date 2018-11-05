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
    
    init(router: RouterType, factory: OnboardingModuleFactory) {
        self.factory = factory
        super.init(router: router)
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
