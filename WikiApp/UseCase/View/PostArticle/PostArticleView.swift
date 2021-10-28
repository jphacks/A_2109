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
                .padding(16)
                
            TextEditor(text: $name)
                .padding(.vertical, 16)
        }
    }
}
