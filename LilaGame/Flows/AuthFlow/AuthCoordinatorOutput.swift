//
//  AuthCoordinatorOutput.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

protocol AuthCoordinatorOutput: class {
    var finishFlow: (() -> Void)? { get set }
}
