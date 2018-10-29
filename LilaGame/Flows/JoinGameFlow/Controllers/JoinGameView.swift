//
//  JoinGameView.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

protocol JoinGameView: BaseView, FlowController { }

enum JoinGameActions {
    case nicknameAdded(nickname: String)
    case avatarAdded(avatar: String)
    case gameSelected(url: String)
    case cancel
}
