//
//  PostArticleView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/26.
//

import SwiftUI

struct PostArtticleView: View {
    @State private var name = "";var body: some View {
        NavigationView{
        TextField("記事内容をここに投稿", text: $name)
            .frame(maxWidth: .infinity,maxHeight:.infinity, alignment:.topLeading)
            .navigationTitle("記事投稿")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.leading, 16)
        
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("投稿") {}
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button("戻る"){}
                }
            }
    }
    }
}

