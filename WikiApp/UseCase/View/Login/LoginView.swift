//
//  LoginView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/26.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var isPreviewSignUp = false
    @State private var isPreviewPassword = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.background.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 24) {
                
                Text("Welcom Back!")
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                
                VerticalSpacer(height: 32)
                
                CommonTextField(text: $viewModel.mail, placeholder: "mail")
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                HStack(alignment: .center, spacing: 0) {
                    
                    if isPreviewPassword {
                        CommonTextField(text: $viewModel.password, placeholder: "password")
                    } else {
                        SecureField("password", text: $viewModel.password, onCommit: {})
                            .font(.h2)
                            .frame(idealWidth: 100 ,maxWidth: .infinity, idealHeight: 60, maxHeight: 80)
                            .padding(.leading, 16)
                            .background(Color.formBackground)
                            .disableAutocorrection(isPreviewPassword)
                    }
                    Text(viewModel.password.count.description)
                        .foregroundColor(viewModel.password.count >= 8 ? .formText : .red)
                        .padding(.trailing, 8)
                        .padding(.top, 16)
                    
                    Button(action: { isPreviewPassword.toggle() }) {
                        Image(symbol: isPreviewPassword ? SFSymbol.eye : SFSymbol.cloeEye)
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 4)
                    .padding(.top, 16)
                }
                .background(Color.formBackground)
                .cornerRadius(10)
                .padding(.horizontal, 32)
                
                VerticalSpacer(height: 48)
                
                CommonButton(title: "Login", action: viewModel.login, color: viewModel.readyToCreate ? .primary : .nonLogin)
                    .padding(.top, 32)
                    .disabled(!viewModel.readyToCreate)
                    .fullScreenCover(isPresented: $viewModel.stateObject, onDismiss: nil) {
                        WikiAppView()
                    }
                
                Button(action: { isPreviewSignUp.toggle() }) {
                    Text("新規登録はこちら")
                        .foregroundColor(.text)
                }
                .fullScreenCover(isPresented: $isPreviewSignUp, onDismiss: nil) {
                    SignUpView()
                }
            }
        }
    }
}
