//
//  MemberDetailViewController.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
    // MARK: - Properties
    let memberDetailView = MemberDetailView()
    let member: Member
    
    // MARK: - Initializers
    init(member: Member) {
        self.member = member
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(memberDetailView)
        memberDetailView.tableView.dataSource = self
        memberDetailView.tableView.delegate = self
        memberDetailView.tableView.estimatedRowHeight = 1000
        setupNavigationBar()
        setupProfileImage()
    }
    
    // MARK: - Initial UI Setup
    private func setupProfileImage() {
        ImageHelper.manager.getImage(from: member.profile_image) { (image, error) in
            if let error = error {
                print(error)
            } else if let image = image {
                DispatchQueue.main.async {
                    self.memberDetailView.profileImageView.image = image
                }
            }
        }
    }
    
    // MARK: - Navigation Bar Setup
    private func setupNavigationBar() {
        navigationItem.title = member.name.components(separatedBy: " ")[0]
    }

}

// MARK: - Table View Data Source Methods
extension MemberDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bioCell", for: indexPath) as! BioTableViewCell
                
        cell.nameLabel.text = member.name
        cell.positionLabel.text = member.position
        cell.personalityLabel.text = member.personality
        cell.interestsLabel.text = member.interests
        cell.datingPreferencesLabel.text = member.dating_preferences
        
        return cell
    }
}

// MARK: - Table View Delegate Methods
extension MemberDetailViewController: UITableViewDelegate {    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let imageHeightConstraint = self.memberDetailView.profileImageViewHeightConstraint else { return }
        imageHeightConstraint.constant = max(0, -scrollView.contentOffset.y)
        UIView.animate(withDuration: 0) {
            self.memberDetailView.profileImageView.layoutIfNeeded()
        }
    }
    
}

