//
//  PostArticleView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/26.
//
import SwiftUI

struct PostArticleView: View {
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            HStack(alignment: .top, spacing: 0) {
                Image("nene")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .cornerRadius(20)
                    
                TextEditor(text: $name)
            }
           
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
