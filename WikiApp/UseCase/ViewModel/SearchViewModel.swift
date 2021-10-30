//
//  SearchViewModel.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var isbn: String = ""
    @Published var loading: Bool = false
    
    @Published private(set) var book: Stateful<Search> = .idle
    
    private var anyCancellable = Set<AnyCancellable>()
    
    func getSearch() {
        SearchClient(isbn: isbn).search()
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.book = .loading
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self?.book = .failed(error)
                case .finished: print("finish")
                }
            }, receiveValue: { [weak self] state in
                guard let self = self else { return }
                self.book = .loaded(state)
            }
            ).store(in: &anyCancellable)
    }
}

