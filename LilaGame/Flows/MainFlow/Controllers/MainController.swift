//
//  MainController.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension MainController: MainView {
    var onJoinGameFlowSelect: ((UINavigationController) -> ())? {
        get {
            
        }
        set {
            
        }
    }
    
    var onSettingsFlowSelect: ((UINavigationController) -> ())? {
        get {
            
        }
        set {
            
        }
    }
    
    var onViewDidLoad: ((UINavigationController) -> ())? {
        get {
            
        }
        set {
            
        }
    }
}
