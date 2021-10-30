//
//  Search.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Foundation

struct Search: Codable {
    let title: String
    let isbn: String
    let author: String
    let isPinned: Bool
    let amazonLink: String
    let ID: String
}
