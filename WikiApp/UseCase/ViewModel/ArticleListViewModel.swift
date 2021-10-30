//
//  ArticleListViewModel.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/29.
//

import Foundation
import Combine

final class ArticleListViewModel: ObservableObject{
    @Published var bookID = 1
    @Published var bookAuthor = ""
    @Published var amazonLink = ""
    
    @Published private(set) var articles: Stateful<ArticleList> = .idle
    
    private var anyCancellable = Set<AnyCancellable>()
    
    func getArticleList(bookID: Int) {
        ArticlelistClient(bookID: bookID).getArticleList()
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.articles = .loading
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self?.articles = .failed(error)
                case .finished: print("finish")
                }
            }, receiveValue: { [weak self] state in
                guard let self = self else { return }
                self.articles = .loaded(state)
            }
            ).store(in: &anyCancellable)
    }
    
}
