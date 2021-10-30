//
//  BookClient.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Combine

struct BookClient {
    let isbn: String
    func search() -> AnyPublisher<[Book], Error> {
        APIClient.GetBookIcon().getImage(isbn: isbn)
    }
}
