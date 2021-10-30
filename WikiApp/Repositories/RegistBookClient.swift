//
//  RegistBookClient.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Combine

struct RegistBookClient {
    let register: Book
    func registBook() -> AnyPublisher<RegistBook, Error> {
        APIClient.RegisterBook(register: register).registBook()
    }
}

