//
//  Repository.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import ObjectMapper

class Repository: Mappable
{
    // Properties
    var title: String = ""
    var stars: Int = 0
    // End Properties
    
    // Initializers
    required init?(map: Map) {
    }
    // End Initializers
    
    // Events
    func mapping(map: Map) {
        title <- map["name"]
        stars <- map["stargazers_count"]
    }
    // End Events
    
    // Methods
    // End Methods
}
