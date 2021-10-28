//
//  LoginViewModel.swift
//  WikiApp
//
//  Created by tiking on 2021/10/27.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var mail = ""
    @Published var password = ""
    @Published var readyToCreate = false
    @Published var stateObject = false
    
    @Published private(set) var loginState: Stateful<String> = .idle
    
    private var anyCancellable = Set<AnyCancellable>()
    
    init() {
        $mail
            .combineLatest($password)
            .map {
                let mail = $0.0
                let password = $0.1
                
                guard mail.count > 0, (password.count != 0) else { return false}
                return true
            }
            .assign(to: \.readyToCreate, on: self)
            .store(in: &anyCancellable)
    }
    
    func login() {
        LoginClient(mail: mail, password: password).login()
            .handleEvents(receiveSubscription: { [weak self] _ in
                print("test")
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
            }, receiveValue: { [weak self] state in
                print(state)
                self?.stateObject.toggle()
            }
            ).store(in: &anyCancellable)
    }
}
