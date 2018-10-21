//
//  UIViewControllerExtensions.swift
//  LilaGame
//
//  Created by radioshaolin on 21.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

extension UIViewController {
    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }
    
    class func controllerFromStoryboard(_ storyboard: Storyboards) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
    }
    
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}

extension UIViewController {
    /// General extension to instansiate View Controller from Storyboard file
    class func fromStoryboard(name: String? = nil) -> Self {
        let name = name ?? String(describing: self)
        let bundle = Bundle(for: self)
        return instantiateFromStoryboardHelper(type: self, name: name, bundle: bundle)
    }
    
    private class func instantiateFromStoryboardHelper<T>(type: T.Type, name: String, bundle: Bundle? = nil) -> T {
        let storyboard = UIStoryboard.init(name: name, bundle: bundle)
        let identifier = String(describing: type)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
