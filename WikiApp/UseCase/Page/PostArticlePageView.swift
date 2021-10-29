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
                                .foregroundColor(.primary)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {}){
                            Image(symbol: SFSymbol.paperplane)
                                .foregroundColor(.primary)
                        }
                    }
                }
        }
    }
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
