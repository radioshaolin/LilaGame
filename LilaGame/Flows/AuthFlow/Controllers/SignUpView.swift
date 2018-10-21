//
//  SignUpView.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

protocol SignUpView: BaseView {
    
    var confirmed: Bool { get set }
    var onSignUpComplete: (() -> Void)? { get set }
    var onTermsButtonTap: (() -> Void)? { get set }
    
    func conformTermsAgreement(_ agree: Bool)
}
