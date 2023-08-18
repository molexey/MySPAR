//
//  loyaltyProgramView.swift
//  Мой SPAR
//
//  Created by molexey on 17.08.2023.
//

import UIKit

class LoyaltyProgramView: UIView {
    
    // MARK: - Views
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 4
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        return view
    }()
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "weLoveFresh")
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    private lazy var numberOfBonusesLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    private lazy var bonusesLabel: UILabel = {
        let label = UILabel()
        label.text = "бонусов"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.shadowPath = UIBezierPath( roundedRect: bounds, cornerRadius: imageView.layer.cornerRadius).cgPath
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        containerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        containerView.addSubview(numberOfBonusesLabel)
        numberOfBonusesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfBonusesLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            numberOfBonusesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16)
        ])
        
        containerView.addSubview(bonusesLabel)
        bonusesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bonusesLabel.bottomAnchor.constraint(equalTo: numberOfBonusesLabel.bottomAnchor, constant: 0),
            bonusesLabel.leadingAnchor.constraint(equalTo: numberOfBonusesLabel.trailingAnchor, constant: 16)
        ])
    }
}
