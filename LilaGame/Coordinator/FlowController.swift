//
//  FlowController.swift
//  LilaGame
//
//  Created by radioshaolin on 28.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

protocol FlowController {
    associatedtype T //enum Action type
    var completionHandler: ((T) -> Void)? { get set }
}
