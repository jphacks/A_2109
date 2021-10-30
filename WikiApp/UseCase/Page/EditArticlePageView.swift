//
//  PostArticlePageView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

struct EditArticlePageView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            EditArticleView(context: "POSTとGETがよく使われるのは、\nWebのFormがこの二つしか受け付けてなかったためである")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: dismiss) {
                            Image(symbol: SFSymbol.xmark)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: dismiss){
                            Image(symbol: SFSymbol.paperplane)
                        }
                        .foregroundColor(.primary)
                    }
                }
        }
        .accentColor(.primary)
    }
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
