//
//  RepositoryModel.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import Foundation

class RepositoryModel
{
    // Properties
    var path: String = ""
    // End Properties
    
    // Initializers
    init(repositoryPath: String) {
        path = repositoryPath
    }
    // End Initializers
    
    // Events
    // End Events
    
    // Methods
    func loadRepository(completion: (_ error: Error?, _ repository: Repository) -> ()) {
        let repository = Repository()
        repository.title = "Repository title"
        repository.stars = 2
        repository.body = "This is a demo respository"
        
        completion(nil, repository)
    }
    
    func loadIssues(completion: (_ error: Error?, _ issues: [Issue]) -> ()) {
        let issue = Issue()
        issue.title = "Issue 1 Issue 1 Issue 1 Issue 1 Issue 1 Issue 1 Issue 1 Issue 1"
        issue.author = "Author 1"
        issue.state = .closed
        issue.createAt = Date()
        
        let issue2 = Issue()
        issue2.title = "Issue 2"
        issue2.author = "Author 2"
        issue2.state = .open
        issue2.createAt = Date().addingTimeInterval(1000000)
        
        completion(nil, [issue, issue2])
    }
    // End Methods
}
