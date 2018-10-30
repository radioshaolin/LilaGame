//
//  CoordinatorOutput.swift
//  LilaGame
//
//  Created by radioshaolin on 28.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

protocol CoordinatorOutput {
    var flowCompletionHandler: (() -> Void)? { get set }
}
