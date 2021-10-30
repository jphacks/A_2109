//
//  SignUpViewModel.swift
//  WikiApp
//
//  Created by tiking on 2021/10/30.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var mail = ""
    @Published var password = ""
    @Published var readyToCreate = false
    @Published var stateObject = false
    @Published var imageString = ""
    @Published var userName = ""
    
    @Published private(set) var loginState: Stateful<String> = .idle
    
    private var anyCancellable = Set<AnyCancellable>()
    
    init() {
        $mail
            .combineLatest($password, $userName)
            .map {
                let mail = $0.0
                let password = $0.1
                let userName = $0.2
                
                guard mail.count > 0, (password.count != 0) , userName.count > 0 else { return false}
                return true
            }
            .assign(to: \.readyToCreate, on: self)
            .store(in: &anyCancellable)
    }
    
    func signUp() {
        SignUpClient(mail: mail, password: password, userName: userName, imageString: imageString).signUp()
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
            }, receiveValue: { [weak self] state in
                guard let self = self else { return }
                self.stateObject.toggle()
                UserDefaults.standard.set(true, forKey: "session")
                print(self.stateObject)
            }
            ).store(in: &anyCancellable)
    }
}

