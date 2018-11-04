//
//  JoinGameController.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class JoinGameController: UIViewController, JoinGameView  {
    typealias T = JoinGameActions
    var completionHandler: ((T) -> Void)?
    
    //controller handler
    var onCompleteJoinGame: ((Player) -> ())?
    var onCancelJoinGame: (() -> Void)?
    
    deinit {
        let selfName = String(describing: self)
        print("::\(selfName):: is deinited")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(describing: self)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(JoinGameController.cancelJoinGameButtonClicked(_:)))
    }
    
    @IBAction func playGameButtonClicked(_ sender: UIBarButtonItem) {
        completionHandler?(.nicknameAdded(nickname: "Navuhodonosor"))
    }
    
    @IBAction func cancelJoinGameButtonClicked(_ sender: UIBarButtonItem) {
        completionHandler?(.cancel)
    }
}

