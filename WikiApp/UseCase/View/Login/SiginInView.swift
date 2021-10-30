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
    @State private var image: UIImage?
    @State var showingImagePicker = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.background.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 24) {
                
                Text("Welcome!")
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                
                Button(action: {
                    showingImagePicker = true
                }){
                    if let uiImage = image {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    }else {
                        Image("noimage")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    }
                }
                
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
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
            }
        }
    }
}

