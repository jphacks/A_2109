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
        let cover: String
    }
}
