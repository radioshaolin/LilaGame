//
//  CoordinatorFactory.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
//    func makeTabbarCoordinator(coordinatorFactory: CoordinatorFactory) -> (coordinator: Coordinator<DeepLink>, toPresent: Presentable)
//    func makeOnboardingCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & OnboardingCoordinatorOutput, toPresentable: Presentable)
//    func makeAuthCoordinator(router: RouterType) -> (coordinator: Coordinator<DeepLink> & AuthCoordinatorOutput, toPresentable: Presentable)
//    func makeStartGameCoordinator(router: Router) ->  Coordinator<DeepLink> & StartGameCoordinatorOutput
    func makeGameCoordinator() ->  Coordinator<DeepLink>
    func makeSettingsCoordinator() -> Coordinator<DeepLink>
}
