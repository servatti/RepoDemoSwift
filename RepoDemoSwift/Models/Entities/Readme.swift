//
//  Readme.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import ObjectMapper

class Readme: Mappable
{
    // Properties
    var content: String = ""
    // End Properties
    
    // Initializers
    required init?(map: Map) {
    }
    // End Initializers
    
    // Events
    func mapping(map: Map) {
        content <- map["content"]
    }
    // End Events
    
    // Methods
    // End Methods
}
