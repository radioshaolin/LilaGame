//
//  OnboardingController.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController, OnboardingView {
    
    var onFinish: (() -> Void)?
    
    deinit {
        let selfName = String(describing: self)
        print("::\(selfName):: is deinited")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishTapped(_ sender: Any) {
        onFinish?()
    }
}
