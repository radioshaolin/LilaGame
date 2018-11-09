//
//  MainNavigationController.swift
//  LilaGame
//
//  Created by radioshaolin on 11/7/18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    private var onboardingWasShown = false
    private var isAutorized = true
    lazy var testVC: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .brown
        return vc
    }()
    lazy var presentNavVC: UINavigationController = {
        return UINavigationController(rootViewController: testVC)
    }()
    
    lazy var home: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.view.backgroundColor = .blue
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return navigationController
    }()

    lazy var account: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.view.backgroundColor = .red
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return navigationController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta


        
        
        if onboardingWasShown {
            let tabBarVC = UITabBarController()
            tabBarVC.view.backgroundColor = .green
            tabBarVC.setViewControllers([home, account], animated: true)
            viewControllers = [tabBarVC]
 
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.presentVC()
            }
        }
    }
    
    func presentVC() {
//        pushViewController(modalVC, animated: true)
        present(presentNavVC, animated: true, completion: nil)
    }
    
    func closeVC() {
        dismiss(animated: true, completion: nil)
    }
    
}
