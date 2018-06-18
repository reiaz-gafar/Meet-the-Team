//
//  MemberTableViewCell.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    // MARK: - Properties
    lazy public var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "profilePlaceholder")
        return imageView
    }()
    
    lazy public var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Styles.Font.cellLarge
        label.textColor = Styles.Color.cmbGrey
        return label
    }()
    
    lazy public var positionLabel: UILabel = {
        let label = UILabel()
        label.font = Styles.Font.cellSmall
        label.textColor = Styles.Color.cmbGrey
        return label
    }()

    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Setup Functions    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.bounds.width/2.0
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 4
        profileImageView.layer.borderColor = Styles.Color.cmbBlue.cgColor
    }
    
    private func commonInit() {
        backgroundColor = .white
        accessoryType = .disclosureIndicator
        tintColor = Styles.Color.cmbGrey
        setupViews()
    }
    
    private func setupViews() {
        setupProfileImageView()
        setupNameLabel()
        setupPositionLabel()
    }
    
    public func configureCell(with member: Member) {
        ImageHelper.manager.getImage(from: member.profile_image) { (image, error) in
            if let error = error {
                print("error setting profile image: \(error)")
            } else if let image = image {
                DispatchQueue.main.async {
                    self.profileImageView.image = image
                }
            }
        }
        nameLabel.text = member.name
        positionLabel.text = member.position
    }

}

// MARK: - Subview Setup
extension MemberTableViewCell {
    private func setupProfileImageView() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: bounds.width/20),
            profileImageView.heightAnchor.constraint(equalTo: heightAnchor, constant: -16),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
            ])
    }
    
    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: bounds.width/20),
            nameLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -2),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.60),
            nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            ])
    }
    
    private func setupPositionLabel() {
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(positionLabel)
        NSLayoutConstraint.activate([
            positionLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: bounds.width/20),
            positionLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 2),
            positionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.60),
            positionLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            ])
    }

}
