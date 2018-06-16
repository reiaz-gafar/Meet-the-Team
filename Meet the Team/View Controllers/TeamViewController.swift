//
//  TeamViewController.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    
    // MARK: - Properties
    let teamView = TeamView()
    var members = [Member]() {
        didSet {
            DispatchQueue.main.async {
                self.teamView.tableView.reloadData()
            }
        }
    }
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(teamView)
        teamView.tableView.dataSource = self
        teamView.tableView.delegate = self
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        JSONClient.parseJSON { (members, error) in
            if let error = error {
                print(error)
            } else if let members = members {
                self.members = members
            }
        }
    }
    
    // MARK: - Navigation Bar Setup
    private func setupNavigationBar() {
        navigationItem.title = "Meet The Team"
    }

}

// MARK: - Table View Data Source Methods
extension TeamViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath) as! MemberTableViewCell
        let member = members[indexPath.row]
        
        ImageHelper.manager.getImage(from: member.profile_image) { (image, error) in
            if let error = error {
                print("error setting profile image: \(error)")
            } else if let image = image {
                DispatchQueue.main.async {
                    cell.profileImageView.image = image
                }
            }
        }
        
        cell.nameLabel.text = member.name
        cell.positionLabel.text = member.position
        return cell
    }
}

// MARK: - Table View Delegate Methods
extension TeamViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = members[indexPath.row]
        let memberDetailViewController = MemberDetailViewController(member: member)
        navigationController?.pushViewController(memberDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
