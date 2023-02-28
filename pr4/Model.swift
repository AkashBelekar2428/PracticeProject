//
//  Model.swift
//  pr4
//
//  Created by Aniket Patil on 17/02/23.

import Foundation

// MARK: - Welcome
struct Model: Codable {
    var data: [Datas]?
}

// MARK: - Datum
struct Datas: Codable {
    var id: Int?
    var email, firstName, lastName: String?
    var avatar: String?

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
