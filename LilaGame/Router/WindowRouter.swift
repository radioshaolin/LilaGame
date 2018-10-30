//
//  WindowRouter.swift
//  LilaGame
//
//  Created by radioshaolin on 31.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit
import SafariServices

public protocol WindowRouterType: class {
    var window: UIWindow { get }
    init(window: UIWindow)
    func setRootModule(_ module: Presentable)
}


final public class WindowRouter: NSObject, WindowRouterType {
    
    public unowned let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    public func setRootModule(_ module: Presentable) {
        let viewController = module.toPresentable()
        window.rootViewController = viewController
    }
}
