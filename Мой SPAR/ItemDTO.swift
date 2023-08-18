//
//  ItemDTO.swift
//  Мой SPAR
//
//  Created by molexey on 18.08.2023.
//

import Foundation

struct ItemDTO: Codable {
    var id: String
    var imageUrl: String
    var price: String
    var badgeText: String?
    var discount: Int?
}
