//
//  ViewController.swift
//  Rachio
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var coordinator = AuthenticationCoordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator.view = self
        userTappedLogin()
    }
    
    func userTappedLogin() {
        showLoading()
        coordinator.authenticate()
    }
}

extension ViewController: AuthenticationView {
    func showAuthenticationSuccessful() {
        hideLoading()
        performSegue(withIdentifier: "showInfo", sender: nil)
    }
    
    func showAuthenticationFailed(with message: String) {
        hideLoading()
        print(message)
    }
}

