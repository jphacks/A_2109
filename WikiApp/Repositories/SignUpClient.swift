//
//  SignUpClient.swift
//  WikiApp
//
//  Created by tiking on 2021/10/31.
//

import Combine

struct SignUpClient {
    let mail: String
    let password: String
    let userName: String
    let imageString: String
    
    func signUp() -> AnyPublisher<SignUp, Error> {
        PostAPIClient.SignUpClient(mail: mail, password: password, userName: userName, imageString: imageString).signUp()
    }
}
