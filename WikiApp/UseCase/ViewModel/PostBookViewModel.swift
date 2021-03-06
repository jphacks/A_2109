//
//  PostBookViewModel.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Foundation
import Combine

final class PostBookViewModel: ObservableObject {
    @Published var isbn: String = ""
    @Published var loading: Bool = false
    
    
    @Published private(set) var book: Stateful<[Book]> = .idle
    @Published private(set) var register: Stateful<RegistBook> = .idle
    
    private var anyCancellable = Set<AnyCancellable>()
    
    func getBook() {
        BookClient(isbn: isbn).search()
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
    
    func registBook(book: Book) {
        RegistBookClient(register: book).registBook()
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.register = .loading
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self?.register = .failed(error)
                case .finished: print("finish")
                }
            }, receiveValue: { [weak self] state in
                guard let self = self else { return }
                self.register = .loaded(state)
            }
            ).store(in: &anyCancellable)
    }
}
