//
//  Presentable.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

public protocol Presentable {
    func toPresentable() -> UIViewController
}

extension UIViewController: Presentable {
    public func toPresentable() -> UIViewController {
        return self
    }
}

extension Presentable {
    func deinitConsoleDebuger() {
        let selfName = String(describing: self)
        print("=== \(selfName) === is deinited")
    }
}

