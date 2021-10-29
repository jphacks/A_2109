//
//  APIClient.swift
//  WikiApp
//
//  Created by tiking on 2021/10/27.
//
import Foundation
import Combine

enum APIClient {
    struct LoginClient {
        let mail: String
        let password: String
        
        // TODO: あとで追加します
        func login() -> AnyPublisher<Login, Error> {
            let url = URL(string: "http://localhost:8000/login")!
            var urlRequest = URLRequest(url: url)
            let str = "mailAddress=\(mail)&password=\(password)" as NSString
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
    
    struct GetTop {
        func getTop() -> AnyPublisher<String, Error> {
            let url = URL(string: "http://localhost:8000/top")!
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
             
            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap() { element -> Data in
                    print(element.response)
                    guard let httpResponse = element.response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        throw URLError(.badServerResponse)
                    }
                    return element.data
                }
                .decode(type: String.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    }
}
