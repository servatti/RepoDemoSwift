//
//  BaseViewController.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController
{
    // Properties
    // End Properties
    
    // Initializers
    // End Initializers
    
    // Events
    // End Events
    
    // Methods
    func showLoading(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
    // End Methods
}
