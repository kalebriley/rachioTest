//
//  Device.swift
//  Rachio
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import Foundation

struct Device {
    let id: String
    let status: String
    let zones: [IrrigationZone]
}
