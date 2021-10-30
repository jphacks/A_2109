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
        APIClient.LoginClient(mail: mail, password: password).login()
    }
}

struct SignUpClient {
    let mail: String
    let password: String
    let userName: String
    let imageString: String
    
    func signUp() -> AnyPublisher<SignUp, Error> {
        APIClient.SignUpClient(mail: mail, password: password, userName: userName, imageString: imageString).signUp()
    }
}
