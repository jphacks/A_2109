//
//  BookClient.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Combine

struct BookClient {
    let register: RegistBook
    func search() -> AnyPublisher<RegistBook, Error> {
        APIClient.RegisterBook(register: register)
    }
}
