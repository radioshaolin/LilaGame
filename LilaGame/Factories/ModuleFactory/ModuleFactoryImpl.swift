//
//  ModuleFactoryImpl.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

final class ModuleFactoryImpl: ModuleFactory {
    
    func makeLoginOutput() -> LoginView {
        return LoginController.controllerFromStoryboard(.auth)
    }
    
    func makeSignUpHandler() -> SignUpView {
        return SignUpController.controllerFromStoryboard(.auth)
    }
    
    func makeTermsOutput() -> TermsView {
        return TermsController.controllerFromStoryboard(.auth)
    }
    
    func makeOnboardingModule() -> OnboardingView {
        return OnboardingController.controllerFromStoryboard(.onboarding)
    }

    func makeJoinGameOutput() -> JoinGameView {
        return JoinGameController.controllerFromStoryboard(.joinGame)
    }
    
    func makeGameOutput() -> GameView {
        return GameController.controllerFromStoryboard(.game)
    }

    func makeSettingsOutput() -> SettingsView {
        return SettingsController.controllerFromStoryboard(.settings)
    }
}
