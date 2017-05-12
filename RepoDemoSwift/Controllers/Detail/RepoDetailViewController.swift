//
//  RepoDetailViewController.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import Foundation
import UIKit

class RepoDetailViewController: BaseViewController
{
    // Properties
    @IBOutlet weak var repositoryTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var issuesButton: UIButton!
    
    var loaded: Bool = false
    // End Properties
    
    // Initializers
    // End Initializers
    
    // Events
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clear()
    }
    
    @IBAction func loadRepositoryDidTap(sender: UIButton) {
        loaded = false
        clear()
        
        loadData(repositoryPath: repositoryTextField.text!)
    }
    
    @IBAction func loadIssuesDidTap(sender: UIButton) {
        loadIssues(repositoryPath: repositoryTextField.text!)
    }
    // End Events
    
    // Methods
    func loadData(repositoryPath: String) {
        let repositoryModel = RepositoryModel(repositoryPath: repositoryPath)
        
        loadRepository(repositoryModel: repositoryModel)
        loadReadme(repositoryModel: repositoryModel)
    }
    
    func loadRepository(repositoryModel: RepositoryModel) {
        showLoading(show: true)
        
        repositoryModel.loadRepository { (error, repository) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                self.showRepository(repository: repository!)
            }
            
            if (self.loaded) {
                self.showLoading(show: false)
            } else {
                self.loaded = true
            }
        }
    }
    
    func loadReadme(repositoryModel: RepositoryModel) {
        repositoryModel.loadReadme { (error, readmeHtml) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                if let content = readmeHtml {
                    self.showReadme(content: content)
                }
            }
            
            if (self.loaded) {
                self.showLoading(show: false)
            } else {
                self.loaded = true
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
        issuesButton.isHidden = false
    }
    
    func showReadme(content: String) {
        webView.loadHTMLString(content, baseURL: nil)
    }
    
    func clear() {
        titleLabel.text = ""
        starsLabel.text = ""
        issuesButton.isHidden = true
        webView.loadHTMLString("", baseURL: nil)
        
        // Post notification with repository path
        let notificationName = Notification.Name(Constants.NotificationClearIssues)
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
    // End Methods
}
