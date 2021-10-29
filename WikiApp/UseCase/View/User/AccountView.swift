//
//  UserView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/29.
//

import SwiftUI

struct AccountView: View {
    
    enum Page: Int {
        case bookMark, like, posrArticle
    }
    
    @State private var selected = Page.bookMark
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image("nene")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.vertical, 16)
            
            Picker("", selection: $selected) {
                Text("ブックマーク")
                    .tag(Page.bookMark)
                Text("いいね")
                    .tag(Page.like)
                Text("投稿記事一覧")
                    .tag(Page.posrArticle)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            ZStack(alignment: .leading) {
                switch selected {
                case .bookMark:
                    BookMarkListView()
                        .isHidden(selected != Page.bookMark)
                    
                case .like:
                    LikeListView()
                        .isHidden(selected != Page.like)
                    
                case .posrArticle:
                    MyPostArticleListView()
                        .isHidden(selected != Page.posrArticle)
                }
            }
        }
    }
}

struct BookMarkListView: View {
    
    var body: some View {
        List {
            // TODO: デフォルト値
            ForEach(0..<5) { _ in
                HStack(alignment: .top, spacing: 0) {
                    Text("aaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaa")
                }
            }
        }
    }
}

struct LikeListView: View {
    
    var body: some View {
        List {
            // TODO: デフォルト値
            ForEach(0..<5) { _ in
                Text("cccccccccccccc\naaaaaaaaaaaaaaaa")
            }
        }
    }
}

struct MyPostArticleListView: View {
    
    var body: some View {
        List {
            // TODO: デフォルト値
            ForEach(0..<5) { _ in
                Text("testtest\naaaaaaaaaaaaaaaa")
            }
        }
    }
}
