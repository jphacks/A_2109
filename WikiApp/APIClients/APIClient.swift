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
            //urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
             
            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap() { elemnt -> Data in
                    guard let httpResponse = elemnt.response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        throw URLError(.badServerResponse)
                    }
                    print(elemnt.data)
                    return elemnt.data
                }
                .decode(type: Login.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    }
}
