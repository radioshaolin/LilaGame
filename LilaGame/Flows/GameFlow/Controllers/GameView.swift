//
//  GameView.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

protocol GameView: BaseView {
    var onDidFinishGame: (() -> Void)? { get set }
}

