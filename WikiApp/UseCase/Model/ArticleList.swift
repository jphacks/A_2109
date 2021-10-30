//
//  ArticleList.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Foundation

struct Article: Codable, Identifiable {
    let context: String
    let isLiked: Bool
    let isBookmarked: Bool
    let updatedDate: String
    let id: Int
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case context
        case id = "ID"
        case isLiked
        case isBookmarked
        case updatedDate
        case userID
      }
}

struct ArticleList: Codable {
    let articles: [Article]
}

