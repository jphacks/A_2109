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
        HStack(alignment: .top, spacing: 0) {
            Image("nene")
                .resizable()
                .frame(width: 32, height: 32)
                .cornerRadius(20)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 8))
            
            ZStack(alignment: .top) {
                TextEditor(text: $name)
                    .padding(.vertical, 16)
                
                if name.isEmpty {
                    HStack(alignment: .center, spacing: 0){
                        Text("記事をここに入力")
                            .foregroundColor(.formText)
                            .padding(.top, 24)
                        Spacer()
                    }
                    .padding(.leading, 8)
                }
            }
        }
    }
}
