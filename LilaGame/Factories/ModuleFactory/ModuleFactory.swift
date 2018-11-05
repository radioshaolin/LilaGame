//
//  ModuleFactory.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

protocol ModuleFactory: OnboardingModuleFactory, SettingsModuleFactory, AuthModuleFactory, JoinGameModuleFactory, GameModuleFactory {}

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


