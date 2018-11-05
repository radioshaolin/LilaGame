//
//  CoordinatorFactory.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol CoordinatorFactory: Loggable {
    func makeTabbarCoordinator(router: RouterType, coordinatorFactory: CoordinatorFactory) -> (coordinator: Coordinator<DeepLink>, toPresent: Presentable)
    func makeOnboardingCoordinator(router: RouterType) -> Coordinator<DeepLink> & OnboardingCoordinatorOutput
    func makeAuthCoordinator(router: RouterType) -> Coordinator<DeepLink> & AuthCoordinatorOutput
//    func makeStartGameCoordinator(router: Router) ->  Coordinator<DeepLink> & StartGameCoordinatorOutput
    func makeGameCoordinator(with navigationController: UINavigationController?) ->  Coordinator<DeepLink>
    func makeSettingsCoordinator(with navigationController: UINavigationController?) -> Coordinator<DeepLink>
}
