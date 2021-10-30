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
