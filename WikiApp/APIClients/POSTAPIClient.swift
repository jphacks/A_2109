//
//  POSTAPIClient.swift
//  WikiApp
//
//  Created by tiking on 2021/10/31.
//

import Foundation
import Combine

enum PostAPIClient {
    struct LoginClient {
        let mail: String
        let password: String
        
        func login() -> AnyPublisher<Login, Error> {
            let url = URL(string: "http://localhost:8000/login")!
            var urlRequest = URLRequest(url: url)
            let str = "mail=\(mail)&password=\(password)" as NSString
            let data = str.data(using: String.Encoding.utf8.rawValue)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = data
             
            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap() { element -> Data in
                    print(element.response)
                    guard let httpResponse = element.response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        throw URLError(.badServerResponse)
                    }
                    return element.data
                }
                .decode(type: Login.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    }
    
    struct SignUpClient {
        let mail: String
        let password: String
        let userName: String
        let imageString: String
        
        func signUp() -> AnyPublisher<SignUp, Error> {
            let url = URL(string: "http://localhost:8000/signin")!
            var urlRequest = URLRequest(url: url)
            let str = "mail=\(mail)&password=\(password)&name=\(userName)&image=\(imageString)" as NSString
            let data = str.data(using: String.Encoding.utf8.rawValue)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = data
             
            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap() { element -> Data in
                    print(element.response)
                    guard let httpResponse = element.response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        throw URLError(.badServerResponse)
                    }
                    return element.data
                }
                .decode(type: SignUp.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    }
    
    struct RegisterBook {
        let register: Book
        
        func registBook() -> AnyPublisher<RegistBook, Error> {
            let url = URL(string: "http://localhost:8000/book")!
            var urlRequest = URLRequest(url: url)
            let str = "isbn=\(register.summary.isbn)&title=\(register.summary.title)&author=\(register.summary.author)&publishDate=\(register.summary.pubdate)" as NSString
            let data = str.data(using: String.Encoding.utf8.rawValue)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = data
             
            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap() { element -> Data in
                    print(element.response)
                    guard let httpResponse = element.response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        throw URLError(.badServerResponse)
                    }
                    return element.data
                }
                .decode(type: RegistBook.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    }
}
