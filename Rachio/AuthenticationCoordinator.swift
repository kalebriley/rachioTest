//
//  AuthenticationCoordinator.swift
//  Rachio
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import Foundation

protocol AuthenticationView: class {
    func showAuthenticationSuccessful()
    func showAuthenticationFailed(with message: String)
}

class AuthenticationCoordinator {
    
    weak var view: AuthenticationView?
    private var network = NetworkClient.shared
    
    func authenticate() {
        network.request(target: PersonTarget.id) { [weak self] result in
            switch result {
            case .success(let json):
                print(json)
                guard let id = json["id"] as? String else {
                    self?.view?.showAuthenticationFailed(with: "Invalid credentials")
                    return
                }
                UserDefaults.standard.set(id, forKey: "current_user_id")
                self?.view?.showAuthenticationSuccessful()
            case .failure(let error):
                print(error.localizedDescription)
                self?.view?.showAuthenticationFailed(with: error.localizedDescription)
            }
        }
    }
}
