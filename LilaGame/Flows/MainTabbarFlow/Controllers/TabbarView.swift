//
//  MainView.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol TabbarView: class {
    var onGameFlowSelect: ((UINavigationController) -> ())? { get set }
    var onSettingsFlowSelect: ((UINavigationController) -> ())? { get set }
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
}
