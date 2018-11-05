//
//  RouterType.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

public protocol Router: class, Presentable {
    var navigationController: UINavigationController { get }
//    var rootViewController: UIViewController? { get }
    
    func setRootModule(_ module: Presentable, hideBar: Bool)
    func present(_ module: Presentable, animated: Bool)
    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
    func popToRootModule(animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func popModule(animated: Bool)
}
