//
//  Top.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Combine

struct TopClient {
    func top() -> AnyPublisher<String, Error> {
        APIClient.GetTop().getTop()
    }
}
