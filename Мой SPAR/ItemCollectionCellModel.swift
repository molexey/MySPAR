//
//  ItemCollectionCellModel.swift
//  Мой SPAR
//
//  Created by molexey on 17.08.2023.
//

import UIKit

class ItemCollectionCellModel {
    
    // MARK: - Public properties

    let id: String
    let imageUrl: String
    let price: String
    let badgeText: String?
    let discount: Int?
    
    // MARK: - Init
    
    init(item: ItemDTO) {
        id = item.id
        imageUrl = item.imageUrl
        price = item.price
        badgeText = item.badgeText
        discount = item.discount
    }
    
    // MARK: - CollectionViewCompatible
    
    var reuseIdentifier: String = ItemCollectionViewCell.reuseId
    var selected: Bool = false
    
    func cellForCollectionView(collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseId, for: indexPath) as! ItemCollectionViewCell
        cell.configure(withModel: self)
        return cell
    }
}
