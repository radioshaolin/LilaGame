//
//  TermsController.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

class TermsController: UIViewController, TermsView {
    
    @IBOutlet weak var termsSwitch: UISwitch! {
        didSet { termsSwitch.isOn = confirmed }
    }
    var confirmed = false
    var onConfirmChanged: ((Bool) -> ())?
    
    @IBAction func termsSwitchValueChanged(_ sender: UISwitch) {
        onConfirmChanged?(sender.isOn)
    }
}
