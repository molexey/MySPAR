//
//  RoundItemCollectionViewCell.swift
//  Мой SPAR
//
//  Created by molexey on 17.08.2023.
//

import UIKit

class RoundItemCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing: RoundItemCollectionViewCell.self)
    
    // MARK: - Views
    
    private lazy var readIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .sparGreen
        return view
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Promo")
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Привелегии «Мой SPAR»"
        return label
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
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//        setNeedsDisplay()
//
//    }
    
    // MARK: - Render
    
    override func draw(_ rect: CGRect) {
        readIndicatorView.layer.cornerRadius = self.readIndicatorView.frame.height / 2
        imageView.layer.cornerRadius = self.imageView.frame.height / 2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        addSubview(readIndicatorView)
        readIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            readIndicatorView.topAnchor.constraint(equalTo: topAnchor),
            readIndicatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            readIndicatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            readIndicatorView.heightAnchor.constraint(equalTo: readIndicatorView.widthAnchor)
        ])
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            imageView.leadingAnchor.constraint(equalTo: readIndicatorView.leadingAnchor, constant: 2),
            imageView.trailingAnchor.constraint(equalTo: readIndicatorView.trailingAnchor, constant: -2),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
}
