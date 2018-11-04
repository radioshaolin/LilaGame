//
//  GameController.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class GameController: UIViewController, GameView {
    //controller handler
    var onDidFinishGame: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(describing: self)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(JoinGameController.cancelJoinGameButtonClicked(_:)))
    }
    
    @IBAction func gameFinishButtonClicked(_ sender: UIBarButtonItem) {
        onDidFinishGame?()
    }
}
