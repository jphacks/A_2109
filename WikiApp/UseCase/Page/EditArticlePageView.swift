//
//  PostArticlePageView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

struct EditArticlePageView: View {
    
    var body: some View {
        NavigationView {
            EditArticleView(context: "この本は素晴らしい！！！！！")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {}) {
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
}
