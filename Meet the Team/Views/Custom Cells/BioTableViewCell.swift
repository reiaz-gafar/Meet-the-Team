//
//  BioTableViewCell.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import UIKit

class BioTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    lazy var blankView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var containerView: TrapezoidView = {
        let view = TrapezoidView(frame: bounds)
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Styles.Color.cmbGrey
        label.font = Styles.Font.detailTitle
        label.numberOfLines = 1
        return label
    }()
    
    lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.textColor = Styles.Color.cmbGrey
        label.font = Styles.Font.detailSubTitle
        label.numberOfLines = 1
        return label
    }()
    
    lazy var personalityTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Styles.Color.cmbGrey
        label.font = Styles.Font.detailLarge
        label.text = "I am..."
        label.numberOfLines = 1
        return label
    }()
    
    lazy var personalityLabel: UILabel = {
        let label = UILabel()
        label.textColor = Styles.Color.cmbGrey
        label.font = Styles.Font.detailSmall
        label.numberOfLines = 0
        return label
    }()
    
    lazy var interestsTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Styles.Color.cmbGrey
        label.font = Styles.Font.detailLarge
        label.text = "I like..."
        label.numberOfLines = 1
        return label
    }()
    
    lazy var interestsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Styles.Color.cmbGrey
        label.font = Styles.Font.detailSmall
        label.numberOfLines = 0
        return label
    }()
    
    lazy var datingPreferencesTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Styles.Color.cmbGrey
        label.font = Styles.Font.detailLarge
        label.text = "I appreciate..."
        label.numberOfLines = 1
        return label
    }()
    
    lazy var datingPreferencesLabel: UILabel = {
        let label = UILabel()
        label.textColor = Styles.Color.cmbGrey
        label.font = Styles.Font.detailSmall
        label.numberOfLines = 0
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
    }
    
    private func commonInit() {
        backgroundColor = .clear
        setupViews()
    }
    
    private func setupViews() {
        setupBlankView()
        setupContainerView()
        setupNameLabel()
        setupPositionLabel()
        setupPersonalityTitleLabel()
        setupPersonalityLabel()
        setupInterestsTitleLabel()
        setupInterestsLabel()
        setupDatingPreferencesTitleLabel()
        setupDatingPreferencesLabel()
    }
    
    public func configureCell(with member: Member) {
        nameLabel.text = member.name
        positionLabel.text = member.position
        personalityLabel.text = member.personality
        interestsLabel.text = member.interests
        datingPreferencesLabel.text = member.dating_preferences
    }
    
}

// MARK: - Subview Setup
extension BioTableViewCell {
    private func setupBlankView() {
        blankView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blankView)
        NSLayoutConstraint.activate([
            blankView.topAnchor.constraint(equalTo: topAnchor),
            blankView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blankView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blankView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.50 - containerView.offsetHeight),
            ])
    }
    
    private func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: blankView.bottomAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
    }
    
    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: blankView.bottomAnchor, constant: bounds.height * 2),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
            
            ])
    }
    
    private func setupPositionLabel() {
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(positionLabel)
        NSLayoutConstraint.activate([
            positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            positionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ])
    }
    
    private func setupPersonalityTitleLabel() {
        personalityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(personalityTitleLabel)
        NSLayoutConstraint.activate([
            personalityTitleLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: 20),
            personalityTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ])
        
    }
    
    private func setupPersonalityLabel() {
        personalityLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(personalityLabel)
        NSLayoutConstraint.activate([
            personalityLabel.topAnchor.constraint(equalTo: personalityTitleLabel.bottomAnchor, constant: 8),
            personalityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            personalityLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.80),
            ])
    }
    
    private func setupInterestsTitleLabel() {
        interestsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(interestsTitleLabel)
        NSLayoutConstraint.activate([
            interestsTitleLabel.topAnchor.constraint(equalTo: personalityLabel.bottomAnchor, constant: 20),
            interestsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ])
    }
    
    private func setupInterestsLabel() {
        interestsLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(interestsLabel)
        NSLayoutConstraint.activate([
            interestsLabel.topAnchor.constraint(equalTo: interestsTitleLabel.bottomAnchor, constant: 8),
            interestsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            interestsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.80),
            ])
    }
    
    private func setupDatingPreferencesTitleLabel() {
        datingPreferencesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datingPreferencesTitleLabel)
        NSLayoutConstraint.activate([
            datingPreferencesTitleLabel.topAnchor.constraint(equalTo: interestsLabel.bottomAnchor, constant: 20),
            datingPreferencesTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ])
    }
    
    private func setupDatingPreferencesLabel() {
        datingPreferencesLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datingPreferencesLabel)
        NSLayoutConstraint.activate([
            datingPreferencesLabel.topAnchor.constraint(equalTo: datingPreferencesTitleLabel.bottomAnchor, constant: 8),
            datingPreferencesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            datingPreferencesLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.80),
            datingPreferencesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            ])
    }
}


