//
//  Int+HTTPStatusCode.swift
//  Rachio
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import UIKit

extension Int {
    public var isSuccessHTTPCode: Bool {
        return 200 <= self && self < 300
    }
}

extension UIViewController {
    var activityIndicator: UIActivityIndicatorView {
        let permIndicator = UIActivityIndicatorView()
        permIndicator.center = self.view.center
        permIndicator.hidesWhenStopped = true
        permIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        return permIndicator
    }
    
    public func showLoading() {
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    public func hideLoading() {
        activityIndicator.stopAnimating()
    }
}
