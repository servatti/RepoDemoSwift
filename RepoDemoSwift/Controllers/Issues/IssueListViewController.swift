//
//  IssueListViewController.swift
//  RepoDemoSwift
//
//  Created by Rafael Servatti on 5/12/17.
//  Copyright © 2017 Fera Solutions. All rights reserved.
//

import Foundation
import UIKit

class IssueListViewController: UIViewController,
                               UITableViewDelegate,
                               UITableViewDataSource
{
    // Properties
    @IBOutlet weak var tableView: UITableView!
    
    var issues: [Issue]?
    
    let IsseTableViewCellIdentifier = "IssueCell"
    // End Properties
    
    // Initializers
    // End Initializers
    
    // Events
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add observer to be notified when user tap Load Repository button
        let notificationName = Notification.Name(Constants.NotificationLoadIssues)
        NotificationCenter.default.addObserver(self, selector: #selector(loadIssuesNotification(notification:)), name: notificationName, object: nil)
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IsseTableViewCellIdentifier, for: indexPath)
        
        let issue = issues![indexPath.row]
        
        cell.textLabel!.text = issue.title
        cell.detailTextLabel!.text = issue.description()
        
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let issue = issues![indexPath.row]
        
        openIssueUrl(url: issue.issueUrl())
    }
    // End Events
    
    // Methods
    func loadIssuesNotification(notification: Notification) {
        let repositoryPath = notification.object as! String
        
        loadIssues(repositoryPath: repositoryPath)
    }
    
    func loadIssues(repositoryPath: String) {
        let repositoryModel = RepositoryModel(repositoryPath: repositoryPath)
        
        repositoryModel.loadIssues { [unowned self] (error, issues) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                self.showIssues(issues: issues)
            }
        }
    }
    
    func showIssues(issues: [Issue]?) {
        self.issues = issues
        
        tableView.reloadData()
    }
    
    func openIssueUrl(url: URL) {
        if (UIApplication.shared.canOpenURL(url)) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil);
        }
    }
    // End Methods
}
