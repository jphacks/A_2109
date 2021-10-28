//
//  PostArticleView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/26.
//
import SwiftUI

struct PostArtticleView: View {
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            HStack(alignment: .top, spacing: 16) {
                Image("nene")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .cornerRadius(20)
                    
                TextEditor(text: $name)
                    .frame(maxWidth: .infinity,maxHeight:.infinity, alignment:.topLeading)
                    .navigationTitle("記事投稿")
                    .navigationBarTitleDisplayMode(.inline)
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
