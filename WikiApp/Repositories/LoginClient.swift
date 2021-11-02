//
//  RepoRepository.swift
//  WikiApp
//
//  Created by tiking on 2021/10/27.
//

import Foundation
import Combine

struct LoginClient {
    let mail: String
    let password: String
    func login() -> AnyPublisher<Login, Error> {
        PostAPIClient.LoginClient(mail: mail, password: password).login()
    }
}
