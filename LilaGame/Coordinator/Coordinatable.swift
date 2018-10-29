//
//  Coordinatable.swift
//  LilaGame
//
//  Created by radioshaolin on 28.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

typealias CoordinatorHandler = () -> Void

protocol CoordinatorOutput {
    var flowCompletionHandler: CoordinatorHandler? { get set }
}
