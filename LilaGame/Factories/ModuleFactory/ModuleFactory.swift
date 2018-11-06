//
//  ModuleFactory.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol ModuleFactory: OnboardingModuleFactory,
                        SettingsModuleFactory,
                        AuthModuleFactory,
                        JoinGameModuleFactory,
                        GameModuleFactory,
                        ApplicationViewFactory {}

protocol ApplicationViewFactory {
    func makeTabBarController() -> UITabBarController
    func makeNavigationController() -> UINavigationController
}

protocol OnboardingModuleFactory {
    func makeOnboardingModule() -> OnboardingView
}

protocol SettingsModuleFactory {
    func makeSettingsOutput() -> SettingsView
}

protocol AuthModuleFactory {
    func makeLoginOutput() -> LoginView
    func makeSignUpHandler() -> SignUpView
    func makeTermsOutput() -> TermsView
}

protocol JoinGameModuleFactory {
    func makeJoinGameOutput() -> JoinGameView
}

protocol GameModuleFactory {
    func makeGameOutput() -> GameView
}


