//
//  LoginView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/26.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.background.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 40) {
                
                Text("Login")
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                
                VerticalSpacer(height: 16)
                
                CommonTextField(text: $viewModel.mail, placeholder: "mail")
                CommonTextField(text: $viewModel.password, placeholder: "password")
                
                VerticalSpacer(height: 32)
                
                CommonButton(title: "Login", action: viewModel.login, color: viewModel.readyToCreate ? .primary : .nonLogin)
                    .padding(.top, 32)
                    .disabled(!viewModel.readyToCreate)
                    .fullScreenCover(isPresented: $viewModel.stateObject, onDismiss: nil) {
                        Text("test")
                    }
            }
        }
    }
    func action() {
        print(self.viewModel.password)
        print(self.viewModel.mail)
    }
}
