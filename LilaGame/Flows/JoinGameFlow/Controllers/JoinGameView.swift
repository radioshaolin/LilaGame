//
//  JoinGameView.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

protocol JoinGameView: BaseView {
    var onCompleteJoinGame: ((Player) -> ())? { get set }
    var onCancelJoinGame: (() -> Void)? { get set }
}
