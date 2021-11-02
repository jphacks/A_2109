//
//  APIClient.swift
//  WikiApp
//
//  Created by tiking on 2021/10/27.
//
import Foundation
import Combine

enum GetAPIClient {
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
    
    struct GetSearch {
        func serch(isbn: String) -> AnyPublisher<Search, Error> {
            let url = URL(string: "http://localhost:8000/search?isbn=\(isbn)")!
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
                .decode(type: Search.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    }
    
    struct GetBookIcon {
        func getImage(isbn: String) -> AnyPublisher<[Book], Error> {
            let url = URL(string: "https://api.openbd.jp/v1/get?isbn=\(isbn)")!
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
                .decode(type: [Book].self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    }
    
    struct GetArticleList {
        let bookID: Int
        
        func getArticlelist() -> AnyPublisher<ArticleList, Error> {
            let url = URL(string: "http://localhost:8000/article?bookID=\(bookID)")!
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
                .decode(type: ArticleList.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    }
}
