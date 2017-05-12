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
    var url: String = ""
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
        createAt <- (map["created_at"], ISO8601DateTransform())
        url <- map["html_url"]
    }
    // End Events
    
    // Methods
    func description() -> String {
        var time = ""
        let hours = Date().timeIntervalSince(createAt) / 3600
        
        if (hours < 24) {
            time = "\(Int(hours)) hours"
        } else {
            time = "\(Int(hours / 24)) days"
        }
        
        return "#\(number) | \(state) | created \(time) ago by \(author)"
    }
    
    func issueUrl() -> URL {
        return URL(string: url)!
    }
    // End Methods
}
