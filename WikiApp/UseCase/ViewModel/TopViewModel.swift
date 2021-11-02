//
//  TopViewModel.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Foundation
import Combine

final class TopViewModel: ObservableObject {
    @Published private(set) var loginState: Stateful<String> = .idle
    
    private var anyCancellable = Set<AnyCancellable>()
    
    func getTop() {
        TopClient().top()
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.loginState = .loading
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self?.loginState = .failed(error)
                case .finished: print("finish")
                }
            }, receiveValue: { _ in }
            ).store(in: &anyCancellable)
    }
}
