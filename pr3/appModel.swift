//
//  modelVC.swift
//  pr3
//
//  Created by Aniket Patil on 16/02/23.
//

import Foundation
struct appModel: Codable {
    var products: [Product]?
}

// MARK: - Product
struct Product: Codable {
    var id: Int?
    var title, description: String?
    var price: Int?
    var discountPercentage, rating: Double?
    var stock: Int?
    var brand, category: String?
    var thumbnail: String?
}
