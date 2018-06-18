//
//  MemberDetailView.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import UIKit

class MemberDetailView: UIView {
    
    // MARK: - Properties
    lazy public var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var profileImageViewHeightConstraint: NSLayoutConstraint?

    lazy public var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(BioTableViewCell.self, forCellReuseIdentifier: "bioCell")
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        return tableView
    }()

    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Setup Functions
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupProfileImageView()
        setupTableView()
    }
    
}

// MARK: - Subview Setup
extension MemberDetailView {
    private func setupProfileImageView() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageView)
        profileImageViewHeightConstraint = profileImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50)
        NSLayoutConstraint.activate([
            profileImageViewHeightConstraint!,
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            ])
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -safeAreaLayoutGuide.layoutFrame.height * 0.50),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            ])
        
    }
    

    
}
