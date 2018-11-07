//
//  AppRouter.swift
//  LilaGame
//
//  Created by Ivan Zemlyaniy on 11/7/18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol AppRouter: Router {
    var window: UIWindow { get }
    init(window: UIWindow)
    func setRootModule(_ module: Presentable)
}
