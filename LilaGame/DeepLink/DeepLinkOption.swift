//
//  DeepLinkOption.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

enum DeepLink {
    case onboarding
    case signUp
    case game(String?)
    case settings
    case terms
}

extension DeepLink {
    static func build(with userActivity: NSUserActivity) -> DeepLink? {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let url = userActivity.webpageURL,
            let _ = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            //TODO: extract string and match with DeepLinkURLConstants
        }
        return nil
    }
    
    static func build(with dict: [String : AnyObject]?) -> DeepLink? {
        guard let id = dict?["launch_id"] as? String else { return nil }
        let gameID = dict?["game_id"] as? String

        switch id {
        case DeepLinkURLConstants.Onboarding: return .onboarding
        case DeepLinkURLConstants.SignUp: return .signUp
        case DeepLinkURLConstants.Game: return .game(gameID)
        case DeepLinkURLConstants.Settings: return .settings
        case DeepLinkURLConstants.Terms: return .terms
        default: return nil
        }
    }
}

struct DeepLinkURLConstants {
    static let Onboarding = "onboarding"
    static let SignUp = "signUp"
    static let Game = "game"
    static let Settings = "settings"
    static let Terms = "terms"
}
