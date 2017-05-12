//
//  RepoDetailViewController.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import Foundation
import UIKit

class RepoDetailViewController: UIViewController
{
    // Properties
    @IBOutlet weak var repositoryTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    // End Properties
    
    // Initializers
    // End Initializers
    
    // Events
    @IBAction func loadRepositoryDidTap(sender: UIButton) {
        loadRepository(repository: repositoryTextField.text!)
    }
    // End Events
    
    // Methods
    func loadRepository(repository: String) {
        let repositoryModel = RepositoryModel(repositoryPath: repository)
        
        repositoryModel.loadRepository { (error, repository) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                showRepository(repository: repository)
            }
        }
    }
    
    func showRepository(repository: Repository) {
        titleLabel.text = repository.title
        starsLabel.text = "\(repository.stars) start\(repository.stars != 1 ? "s" : "")"
        
        if let body = repository.bodyHTML() {
            webView.loadHTMLString(body, baseURL: nil)
        }
    }
    // End Methods
}
