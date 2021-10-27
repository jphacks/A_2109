//
//  LoginViewModel.swift
//  WikiApp
//
//  Created by tiking on 2021/10/27.
//

import Combine

final class LoginViewModel: ObservableObject {
    @Published var mail = ""
    @Published var password = ""
    @Published var readyToCreate = false
    
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
}
