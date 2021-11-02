//
//  SiginInView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject private var viewModel = SignUpViewModel()
    @State private var isPreviewLogin = false
    @State private var image: UIImage?
    @State private var showingImagePicker = false
    @State private var isPreviewPassword = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.background.ignoresSafeArea()
            
            ScrollView {
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
                            Circle()
                                .foregroundColor(.gray)
                                .frame(width: 150, height: 150)
                        }
                    }
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
                    }
                    
                    CommonTextField(text: $viewModel.userName, placeholder: "Name")
                        .cornerRadius(10)
                        .padding(.horizontal, 32)
                    
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
                    
                    CommonButton(title: "SignUp", action: {
                        if let imageData = image?.pngData() {
                            viewModel.imageString = imageData.base64EncodedString()
                        }
                        viewModel.signUp()
                    }, color: viewModel.readyToCreate ? .primary : .nonLogin)
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
}


