//
//  Presentable.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

protocol BaseView: NSObjectProtocol, Presentable { }

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        return self
    }
    
    func deinitLogger() {
        let selfName = String(describing: self)
        print("=== \(selfName) === is deinited")
    }
}
