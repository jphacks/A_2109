//
//  Book.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Foundation

struct Book: Codable {
    let summary: Summary
    
    struct Summary: Codable {
        let isbn: String
        let title: String
        let publisher: String
        let pubdate: String
        let cover: String
        let author: String
    }
}
