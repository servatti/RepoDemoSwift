//
//  RootViewController.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/11/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UISplitViewController
{
    // Properties
    // End Properties
    
    // Initializers
    // End Initializers
    
    // Events
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    // End Events
    
    // Methods
    func setup() {
        maximumPrimaryColumnWidth = view.frame.width
        preferredPrimaryColumnWidthFraction = 0.7
    }
    // End Methods
}
