//
//  CoordinatorFactory.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    func makeMainCoordinator(router: Router) -> (coordinator: Coordinator<DeepLink>, toPresentable: Presentable?)
    func makeOnboardingCoordinator(router: Router) -> (coordinator: Coordinator<DeepLink> & OnboardingCoordinatorOutput, toPresentable: Presentable?)
    func makeAuthCoordinator(router: Router) -> (coordinator: Coordinator<DeepLink> & AuthCoordinatorOutput, toPresentable: Presentable?)
    func makeStartGameCoordinator(router: Router) ->  (coordinator: Coordinator<DeepLink> & StartGameCoordinatorOutput, toPresentable: Presentable?)
    func makeGameplayCoordinator(router: Router) ->  (coordinator: Coordinator<DeepLink> & GameplayCoordinatorOutput, toPresentable: Presentable?)
    func makeSettingsCoordinator(router: Router) -> (coordinator: Coordinator<DeepLink> & SettingsCoordinatorOutput, toPresentable: Presentable?)
}
