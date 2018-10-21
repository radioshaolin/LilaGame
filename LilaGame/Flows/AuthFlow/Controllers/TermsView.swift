//
//  TermsView.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

protocol TermsView: BaseView {
    
    var confirmed: Bool { get set }
    var onConfirmChanged: ((Bool) -> ())? { get set }
}
