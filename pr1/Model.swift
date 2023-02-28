//
//  Model.swift
//  pr1
//
//  Created by Aniket Patil on 16/02/23.
//

import Foundation

// MARK: - Welcome
struct Model: Codable {
    var entries: [Entry]?
}

// MARK: - Entry
struct Entry: Codable {
    var api, description: String?
    var https: Bool?
    var link: String?
    var category: String?

    enum CodingKeys: String, CodingKey {
        case api = "API"
        case description = "Description"
        case link = "Link"
        case category = "Category"
    }
}
