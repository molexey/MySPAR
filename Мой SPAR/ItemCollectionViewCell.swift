//
//  ItemCollectionViewCell.swift
//  Мой SPAR
//
//  Created by molexey on 17.08.2023.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing: ItemCollectionViewCell.self)
    
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
    private lazy var roundedView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "forClients0")
        return view
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.lineBreakStrategy = .pushOut
        return label
    }()
    private lazy var rubImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rubpc")
        view.contentMode = .scaleAspectFit
        return view
    }()
    private lazy var bageView: UIView = {
        let view = UIView()
        view.backgroundColor = .sparGreenLight
        view.layer.cornerRadius = 6
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        view.layer.opacity = 60
        view.isHidden = true
        return view
    }()
    private lazy var badgeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        label.isHidden = true
        return label
    }()
    private lazy var basketButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .sparGreen
        let image = UIImage(named: "basket")
        button.setImage(image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setNeedsDisplay()
        containerView.layer.shadowPath = UIBezierPath( roundedRect: bounds, cornerRadius: roundedView.layer.cornerRadius).cgPath
    }
    
    // MARK: - Public methods
    
    func configure(withModel model: ItemCollectionCellModel) {
        imageView.image = UIImage(named: "\(model.imageUrl)")
        priceLabel.text = String(model.price)
        if let bageText = model.badgeText {
            bageView.isHidden = false
            badgeLabel.text = bageText
            badgeLabel.isHidden = false
        }
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
        
        containerView.addSubview(roundedView)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundedView.topAnchor.constraint(equalTo: containerView.topAnchor),
            roundedView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            roundedView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            roundedView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        roundedView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        roundedView.addSubview(bageView)
        bageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bageView.topAnchor.constraint(equalTo: roundedView.topAnchor),
            bageView.heightAnchor.constraint(equalToConstant: 16),
            bageView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor),
//            bageView.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        bageView.addSubview(badgeLabel)
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            badgeLabel.centerYAnchor.constraint(equalTo: bageView.centerYAnchor),
            badgeLabel.leadingAnchor.constraint(equalTo: bageView.leadingAnchor, constant: 8),
            badgeLabel.trailingAnchor.constraint(equalTo: bageView.trailingAnchor, constant: -6)
        ])
        
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            //priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        addSubview(rubImageView)
        rubImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rubImageView.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            rubImageView.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            rubImageView.heightAnchor.constraint(equalToConstant: 16),
            rubImageView.widthAnchor.constraint(equalToConstant: 16),
        ])
        
        addSubview(basketButton)
        basketButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            basketButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            basketButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            basketButton.heightAnchor.constraint(equalToConstant: 30),
            basketButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
