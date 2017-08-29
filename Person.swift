//
//  Person.swift
//  Rachio
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import Foundation

enum PersonTarget: TargetType {
    case info(id: String)
    case id
    
    var route: String {
        switch self {
        case .info(let id):
            return "/public/person/\(id)"
        case .id:
            return "/public/person/info"
        }
    }
}

struct Person {
    let id: String
    let userName: String
    let fullName: String
    let email: String
    let devices: [Device]
}


