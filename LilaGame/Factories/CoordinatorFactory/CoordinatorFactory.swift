//
//  CoordinatorFactory.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    func makeMainCoordinator() -> (configurator: Coordinator, toPresent: Presentable?)
    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput
    func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput
    func makeJoinGameCoordinatorBox() -> (configurator: Coordinator & JoinGameCoordinatorOutput, toPresent: Presentable?)
    func makeJoinGameCoordinatorBox(navController: UINavigationController?) ->  (configurator: Coordinator & JoinGameCoordinatorOutput, toPresent: Presentable?)
    func makeGameCoordinatorBox() -> (configurator: Coordinator & GameCoordinatorOutput,
        toPresent: Presentable?)
    func makeGameCoordinatorBox(navController: UINavigationController?) ->  (configurator: Coordinator & GameCoordinatorOutput, toPresent: Presentable?)
    func makeSettingsCoordinator() -> Coordinator
    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator
}
