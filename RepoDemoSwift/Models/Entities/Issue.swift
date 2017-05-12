//
//  Issue.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import Foundation
import UIKit

class Issue
{
    // Properties
    var title: String = ""
    var author: String = ""
    var number: Int = 0
    var state: IssueState = .open
    var createAt: Date = Date()
    
    enum IssueState {
        case open
        case closed
    }
    
    // End Properties
    
    // Initializers
    // End Initializers
    
    // Events
    // End Events
    
    // Methods
    func age() -> Int {
        return 99
    }
    // End Methods
}
