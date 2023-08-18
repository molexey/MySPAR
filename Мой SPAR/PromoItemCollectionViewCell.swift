//
//  PromoItemCollectionViewCell.swift
//  Мой SPAR
//
//  Created by molexey on 17.08.2023.
//

import UIKit

class PromoItemCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing: PromoItemCollectionViewCell.self)
    
    // MARK: - Views
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "promo1")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
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
    }
        
    // MARK: - Public methods
    
    func configure(withModel model: Int) {
        imageView.image = UIImage(named: "promo\(model)")
    }
    
    // MARK: - Privata methods
    
    private func setupUI() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
