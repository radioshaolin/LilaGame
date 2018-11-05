//
//  CoordinatorFactory.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    func makeTabbarCoordinator(coordinatorFactory: CoordinatorFactory) -> (coordinator: Coordinator<DeepLink>, toPresent: Presentable)
    func makeOnboardingCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & OnboardingCoordinatorOutput, toPresentable: Presentable)
    func makeAuthCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & AuthCoordinatorOutput, toPresentable: Presentable)
    func makeStartGameCoordinator(router: Router) ->  (coordinator: Coordinator<DeepLink> & StartGameCoordinatorOutput, toPresentable: Presentable?)
//    func makeGameplayCoordinator(router: Router) ->  (coordinator: Coordinator<DeepLink> & GameplayCoordinatorOutput, toPresentable: Presentable?)
    func makeSettingsCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & SettingsCoordinatorOutput, toPresentable: Presentable?)
}
