//
//  ArticleListClient.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Combine

struct ArticlelistClient {
    let bookID: Int
    
    func getArticleList() -> AnyPublisher<ArticleList, Error> {
        GetAPIClient.GetArticleList(bookID: bookID).getArticlelist()
    }
}
