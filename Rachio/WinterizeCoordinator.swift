//
//  WinterizeCoordinator.swift
//  Rachio
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import Foundation

protocol WinterizeView: class {
    func showError(_ message: String)
    func showUser(_ info: String)
}

class WinterizeCoordinator {
    private var network = NetworkClient.shared
    
    weak var view: WinterizeView?
    
    func getPersonInfo() {
        guard let id = UserDefaults.standard.value(forKey: "current_user_id") as? String else {
            view?.showError("You are not properly authenticated")
            return
        }
        
        NetworkClient.shared.request(target: PersonTarget.info(id: id)) { [weak self] result in
            switch result {
            case .success(let userInfo):
                self?.view?.showUser("success")
                print(userInfo)
            case .failure(let error):
                print(error)
                self?.view?.showError(error.localizedDescription)
            }
        }
    }
    
    func getCurrentUserId() {
        network.request(target: PersonTarget.id) { [weak self] result in
            switch result {
            case .success(let json):
                print(json)
                guard let id = json["id"] as? String else {
                    self?.view?.showError("could not parse ID")
                    return
                }
                UserDefaults.standard.set(id, forKey: "current_user_id")
                self?.view?.showUser("success")
            case .failure(let error):
                print(error.localizedDescription)
                self?.view?.showError(error.localizedDescription)
            }
        }
    }
}
