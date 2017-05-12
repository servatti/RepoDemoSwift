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
        loadRepository(repositoryPath: repositoryTextField.text!)
    }
    
    @IBAction func loadIssuesDidTap(sender: UIButton) {
        loadIssues(repositoryPath: repositoryTextField.text!)
    }
    // End Events
    
    // Methods
    func loadRepository(repositoryPath: String) {
        let repositoryModel = RepositoryModel(repositoryPath: repositoryPath)
        
        repositoryModel.loadRepository { (error, repository) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                self.showRepository(repository: repository!)
            }
        }
        
        repositoryModel.loadReadme { (error, readmeHtml) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                if let content = readmeHtml {
                    self.showReadme(content: content)
                }
            }
        }
    }
    
    func loadIssues(repositoryPath: String) {
        // Post notification with repository path
        let notificationName = Notification.Name(Constants.NotificationLoadIssues)
        NotificationCenter.default.post(name: notificationName, object: repositoryPath)
    }
    
    func showRepository(repository: Repository) {
        titleLabel.text = repository.title
        starsLabel.text = "\(repository.stars) star\(repository.stars != 1 ? "s" : "")"
    }
    
    func showReadme(content: String) {
        webView.loadHTMLString(content, baseURL: nil)
    }
    // End Methods
}
