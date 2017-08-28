//
//  Int+HTTPStatusCode.swift
//  Rachio
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import Foundation

extension Int {
    public var isSuccessHTTPCode: Bool {
        return 200 <= self && self < 300
    }
}
