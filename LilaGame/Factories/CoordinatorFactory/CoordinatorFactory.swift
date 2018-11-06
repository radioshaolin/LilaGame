//
//  CoordinatorFactory.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol CoordinatorFactory: Loggable {
    func makeTabbarCoordinator(coordinatorFactory: CoordinatorFactory) -> (coordinator: Coordinator, toPresent: Presentable)
    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput
    func makeGameCoordinator(with navigationController: UINavigationController) ->  Coordinator
    func makeSettingsCoordinator(with navigationController: UINavigationController) -> Coordinator
}
