//
//  MainView.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol MainView: class {
    var onJoinGameFlowSelect: ((UINavigationController) -> ())? { get set }
    var onSettingsFlowSelect: ((UINavigationController) -> ())? { get set }
}
