//
//  Account.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/30.
//

import Foundation

struct Account: Codable{
    let name: String
    let image: String
    let likes: [likes]
    let bookmarks: [bookmarks]
    let posted: [posted]
}
struct likes: Codable{
    let ID: Int
    let bookID: Int
    let userID: Int
    let context: String
    let updatedDate: String
    let chapter: String
    let page: String
}
struct bookmarks: Codable{
    let ID: Int
    let bookID: Int
    let userID: Int
    let context: String
    let updatedDate: String
    let chapter: String
    let page: String
}
struct posted: Codable{
    let ID: Int
    let bookID: Int
    let userID: Int
    let context: String
    let updatedDate: String
    let chapter: String
    let page: String
}
