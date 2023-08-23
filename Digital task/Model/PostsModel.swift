//
//  PostsModel.swift
//  Digital task
//
//  Created by roya TV on 22/08/2023.
//

import Foundation

// MARK: - PostsModelElement
struct PostsModel: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

