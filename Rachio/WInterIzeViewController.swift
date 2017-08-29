//
//  PersonInfoViewController.swift
//  Rachio
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import UIKit

class WinterizeViewController: UIViewController {
    
    fileprivate var coordinator = WinterizeCoordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator.view = self
        coordinator.getPersonInfo()
    }

}

extension WinterizeViewController: WinterizeView {
    func showUser(_ info: String) {
        print(info)
    }
    
    func showError(_ message: String) {
        print(message)
    }
}


