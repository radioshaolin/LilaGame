//
//  DeepLinkOption.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

struct DeepLinkURLConstants {
    static let Onboarding = "onboarding"
    static let SignUp = "signUp"
    static let Login = "login"
    static let Game = "game"
    static let Settings = "settings"
    static let Terms = "terms"
}

enum DeepLinkOption {
    case onboarding
    case signUp
    case login
    case game(String?)
    case settings
    case terms
}

extension DeepLinkOption {
    static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let url = userActivity.webpageURL,
            let _ = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            //TODO: extract string and match with DeepLinkURLConstants
        }
        return nil
    }
    
    static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
        guard let id = dict?["launch_id"] as? String else { return nil }
        let gameID = dict?["game_id"] as? String

        switch id {
        case DeepLinkURLConstants.Onboarding: return .onboarding
        case DeepLinkURLConstants.SignUp: return .signUp
        case DeepLinkURLConstants.Login: return .login
        case DeepLinkURLConstants.Game: return .game(gameID)
        case DeepLinkURLConstants.Settings: return .settings
        case DeepLinkURLConstants.Terms: return .terms
        default: return nil
        }
    }
}

