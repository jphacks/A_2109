//
//  SerchClient.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Combine

struct SearchClient {
    let isbn: String
    func search() -> AnyPublisher<Search, Error> {
        GetAPIClient.GetSearch().serch(isbn: isbn)
    }
}
