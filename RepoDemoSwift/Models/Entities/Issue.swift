//
//  Issue.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import ObjectMapper

class Issue: Mappable
{
    // Properties
    var title: String = ""
    var author: String = ""
    var number: Int = 0
    var state: String = ""
    var createAt: Date = Date()
    // End Properties
    
    // Initializers
    required init?(map: Map) {
    }
    // End Initializers
    
    // Events
    func mapping(map: Map) {
        title <- map["title"]
        author <- map["user.login"]
        number <- map["number"]
        state <- map["state"]
        createAt <- map["created_at"]
    }
    // End Events
    
    // Methods
    func description() -> String {
        return "#\(number) | \(state) | created \(age()) days ago by \(author)"
    }
    
    func age() -> Int {
        return 99
    }
    // End Methods
}
