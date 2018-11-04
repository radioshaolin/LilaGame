//
//  Loggable.swift
//  LilaGame
//
//  Created by radioshaolin on 04.11.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

protocol Loggable {
    func deinitPrintLog()
}

extension Loggable {
    func deinitPrintLog() {
        let selfName = String(describing: self)
        print("=== \(selfName) === is deinited")
    }
}
