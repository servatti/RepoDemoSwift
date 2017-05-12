//
//  RepositoryModel.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

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
    func loadRepository(completion: @escaping (_ error: Error?, _ repository: Repository?) -> ()) {
        let url = apiPath()
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<Repository>) in
            switch response.result {
            case .success(let value):
                completion(nil, value)
                break
                
            case .failure(let error):
                completion(error, nil)
                break
            }
        }
    }
    
    func loadIssues(completion: @escaping (_ error: Error?, _ issues: [Issue]?) -> ()) {
        let url = "\(apiPath())/issues?sort=created&state=all"
        
        Alamofire.request(url).validate().responseArray { (response: DataResponse<[Issue]>) in
            switch response.result {
            case .success(let value):
                completion(nil, value)
                break
                
            case .failure(let error):
                completion(error, nil)
                break
            }
        }
    }
    
    func apiPath() -> String {
        return "\(Constants.GitHubApiBaseUrl)/\(path)"
    }
    
    // End Methods
}
