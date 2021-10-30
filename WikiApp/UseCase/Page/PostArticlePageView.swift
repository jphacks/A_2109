//
//  PostArticlePageView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

struct PostArticlePageView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            PostArticleView()
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
                    }
                }
        }
        .accentColor(.primary)
    }
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
