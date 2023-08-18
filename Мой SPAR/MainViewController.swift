//
//  ViewController.swift
//  Мой SPAR
//
//  Created by molexey on 16.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    private lazy var contentView = UIView()
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.contentMode = .center
        return view
    }()
    private lazy var locationBarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Marker"), for: .normal)
        button.setTitle("Нижний Новгород, Нижегородская область", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = CGColor(gray: 0, alpha: 0.3)
        button.layer.cornerRadius = 16.0
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        return button
    }()
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .sparGreen
        return button
    }()
    private lazy var roundItemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RoundItemCollectionViewCell.self, forCellWithReuseIdentifier: RoundItemCollectionViewCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    private lazy var promoItemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PromoItemCollectionViewCell.self, forCellWithReuseIdentifier: PromoItemCollectionViewCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    private lazy var loyaltyProgramView = LoyaltyProgramView()
    private lazy var forClientsItemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ForClientsCollectionViewCell.self, forCellWithReuseIdentifier: ForClientsCollectionViewCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    private lazy var recommendedItemsView = ItemsView(titleText: "Рекомендуем",
                                                      data: [
                                                        ItemDTO(id: "00", imageUrl: "item0", price: "199.90", badgeText: "Цена по карте"),
                                                        ItemDTO(id: "01", imageUrl: "item1", price: "129.90", badgeText: "Удар по ценам"),
                                                        ItemDTO(id: "02", imageUrl: "item2", price: "90.90", badgeText: "Супер цена"),
                                                        ItemDTO(id: "03", imageUrl: "item3", price: "499", badgeText: "Удар по ценам")
                                                            ])
    private lazy var sweetMoodItemsView = ItemsView(titleText: "Сладкое настроние",
                                                    data: [
                                                        ItemDTO(id: "05", imageUrl: "item5", price: "99.90"),
                                                        ItemDTO(id: "06", imageUrl: "item6", price: "99.90"),
                                                        ItemDTO(id: "07", imageUrl: "item7", price: "99.90")
                                                    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.addSubview(locationBarButton)
        locationBarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationBarButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            locationBarButton.heightAnchor.constraint(equalToConstant: 32),
            locationBarButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        view.addSubview(menuButton)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            menuButton.heightAnchor.constraint(equalToConstant: 32),
            menuButton.widthAnchor.constraint(equalToConstant: 32),
            menuButton.leadingAnchor.constraint(equalTo: locationBarButton.trailingAnchor, constant: 8),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: locationBarButton.bottomAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 0)
        ])
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        stackView.addArrangedSubview(roundItemsCollectionView)
        stackView.addArrangedSubview(promoItemsCollectionView)
        stackView.addArrangedSubview(loyaltyProgramView)
        stackView.addArrangedSubview(forClientsItemsCollectionView)
        stackView.addArrangedSubview(recommendedItemsView)
        stackView.addArrangedSubview(sweetMoodItemsView)
        
        roundItemsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundItemsCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        promoItemsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            promoItemsCollectionView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            promoItemsCollectionView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            promoItemsCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        loyaltyProgramView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loyaltyProgramView.heightAnchor.constraint(equalToConstant: 110),
            loyaltyProgramView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            loyaltyProgramView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16)
        ])
        
        forClientsItemsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forClientsItemsCollectionView.heightAnchor.constraint(equalToConstant: 130),
        ])
    }
}

// MARK: - Extension for UICollectionView DataSource

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.roundItemsCollectionView:
            return 8
        case self.promoItemsCollectionView:
            return 6
        case self.forClientsItemsCollectionView:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.roundItemsCollectionView:
            return collectionView.dequeueReusableCell(withReuseIdentifier: RoundItemCollectionViewCell.reuseId, for: indexPath) as! RoundItemCollectionViewCell
        case self.promoItemsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoItemCollectionViewCell.reuseId, for: indexPath) as! PromoItemCollectionViewCell
            cell.configure(withModel: indexPath.item)
            return cell
        case self.forClientsItemsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForClientsCollectionViewCell.reuseId, for: indexPath) as! ForClientsCollectionViewCell
            let data = ["Абонемент на кофе", "Карта в подарок", "Электронные чеки", "Доставка за 1 час"]
            cell.configure(withModel: indexPath.item, and: data[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - Extension for UICollectionView Delegate

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - Extension for UICollectionViewFlowLayout delegate

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case self.roundItemsCollectionView:
            return CGSize(width: 70, height: 100)
        case self.promoItemsCollectionView:
            return CGSize(width: collectionView.frame.width - 64, height: collectionView.frame.height)
        case self.forClientsItemsCollectionView:
            return CGSize(width: 100, height: 120)
        default:
            return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
