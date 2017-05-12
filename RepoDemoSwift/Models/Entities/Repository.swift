//
//  Repository.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import Foundation

class Repository
{
    // Properties
    var title: String = ""
    var stars: Int = 0
    var body: String?
    // End Properties
    
    // Initializers
    // End Initializers
    
    // Events
    // End Events
    
    // Methods
    func bodyHTML() -> String? {
        return body
    }
    // End Methods
}
