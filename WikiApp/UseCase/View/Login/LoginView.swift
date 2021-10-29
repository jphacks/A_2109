//
//  LoginView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/26.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var isPreviewLogin = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.background.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 24) {
                
                Text("Welcom Back!")
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                
                VerticalSpacer(height: 32)
                
                CommonTextField(text: $viewModel.mail, placeholder: "mail")
                CommonTextField(text: $viewModel.password, placeholder: "password")
                
                VerticalSpacer(height: 48)
                
                CommonButton(title: "Login", action: viewModel.login, color: viewModel.readyToCreate ? .primary : .nonLogin)
                    .padding(.top, 32)
                    .disabled(!viewModel.readyToCreate)
                    .fullScreenCover(isPresented: $viewModel.stateObject, onDismiss: nil) {
                        WikiAppView()
                    }
                
                Button(action: { isPreviewLogin.toggle() }) {
                    Text("新規登録はこちら")
                        .foregroundColor(.text)
                }
                .fullScreenCover(isPresented: $isPreviewLogin, onDismiss: nil) {
                    SignInView()
                }
            }
        }
    }
}
