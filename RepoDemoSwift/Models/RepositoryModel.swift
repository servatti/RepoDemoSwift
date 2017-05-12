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
import Down

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
    
    func loadReadme(completion: @escaping (_ error: Error?, _ readmeHtml: String?) -> ()) {
        let url = "\(apiPath())/readme"
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<Readme>) in
            switch response.result {
            case .success(let value):
                let html = self.parseReadmeContent(content: value.content)
                
                completion(nil, html)
                break
                
            case .failure(let error):
                completion(error, nil)
                break
            }
        }
    }
    
    private func parseReadmeContent(content: String) -> String {
        let data = Data(base64Encoded: content, options: .ignoreUnknownCharacters)!
        let decodedData = String(data: data, encoding: .utf8)!
        
        let html = try! Down(markdownString: decodedData).toHTML()
        
        return html
    }
    
    func apiPath() -> String {
        return "\(Constants.GitHubApiBaseUrl)/\(path)"
    }
    
    // End Methods
}
