//
//  SiginInView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    @State private var isPreviewLogin = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.background.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 24) {
                
                Text("Welcome!")
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                
                VerticalSpacer(height: 32)
                
                CommonTextField(text: $viewModel.userName, placeholder: "Name")
                CommonTextField(text: $viewModel.mail, placeholder: "mail")
                CommonTextField(text: $viewModel.password, placeholder: "password")
                
                VerticalSpacer(height: 48)
                
                CommonButton(title: "SignUp", action: viewModel.login, color: viewModel.readyToCreate ? .primary : .nonLogin)
                    .padding(.top, 32)
                    .disabled(!viewModel.readyToCreate)
                    .fullScreenCover(isPresented: $viewModel.stateObject, onDismiss: nil) {
                        WikiAppView()
                    }
                
                Button(action: { isPreviewLogin.toggle() }) {
                    Text("ログインはこちら")
                        .foregroundColor(.text)
                }
                .fullScreenCover(isPresented: $isPreviewLogin, onDismiss: nil) {
                    LoginView()
                }
            }
        }
    }
}
