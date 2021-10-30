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
            .padding(.bottom, 16)
            
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
    
    @State private var alertIsPresented = false
    @State private var sheetIsPresented = false
    let mockText = ["電子デバイスの魅力に引き込まれたこれこそ神の書物　アーメン", "CMOOSの境地に達した","softwareの基礎がここにあり","テストの重要性に気付かされた","仕事に込める生き様に感化","気づきの重要性を学んだ",]
    
    var body: some View {
        ScrollView {
            ForEach(mockText, id: \.self) { text in
                Text(text)
                    .padding(.bottom, 4)
                
                HStack(alignment: .top, spacing: 24) {
                    Spacer()
                    BookMarkButton(isBookMark: false)
                    LikeButton(isLike: false)
                }
                Divider()
            }
        }
        .background(Color.background)
    }
    
    private func delete() {
        print("delete article")
    }
}

struct LikeListView: View {
    
    @State private var alertIsPresented = false
    @State private var sheetIsPresented = false
    let mockText = ["電子デバイスの魅力に引き込まれたこれこそ神の書物　アーメン", "CMOOSの境地に達した","softwareの基礎がここにあり","テストの重要性に気付かされた","仕事に込める生き様に感化","気づきの重要性を学んだ",]
    
    var body: some View {
        ScrollView {
            ForEach(mockText, id: \.self) { text in
                Text(text)
                    .padding(.bottom, 4)
                
                HStack(alignment: .top, spacing: 24) {
                    Spacer()
                    BookMarkButton(isBookMark: false)
                    LikeButton(isLike: false)
                }
                Divider()
            }
        }
        .background(Color.background)
    }
    
    private func delete() {
        print("delete article")
    }
}

struct MyPostArticleListView: View {
    
    @State private var alertIsPresented = false
    @State private var sheetIsPresented = false
    
    let mockText = ["電子デバイスの魅力に引き込まれたこれこそ神の書物　アーメン", "CMOOSの境地に達した","softwareの基礎がここにあり","テストの重要性に気付かされた","仕事に込める生き様に感化","気づきの重要性を学んだ",]
    
    var body: some View {
        ScrollView {
            ForEach(mockText, id: \.self) { text in
                Text(text)
                    .padding(.bottom, 4)
                
                HStack(alignment: .top, spacing: 24) {
                    Spacer()
                    
                    Button(action: { sheetIsPresented.toggle() }) {
                        Image(symbol: SFSymbol.edit)
                            .foregroundColor(.primary)
                            .padding(.bottom, 4)
                    }
                    .fullScreenCover(isPresented: $sheetIsPresented, onDismiss: nil) {
                        EditArticlePageView()
                    }
                    
                    Button(action: { alertIsPresented.toggle() }) {
                        Image(symbol: SFSymbol.trash)
                            .foregroundColor(.primary)
                            .padding(.trailing, 16)
                    }
                    .alert(isPresented: $alertIsPresented) {
                        Alert(title: Text("確認"), message: Text("本当に記事を削除してもよろしいですか"),
                              primaryButton: .cancel(Text("キャンセル")),
                              secondaryButton: .destructive(Text("削除"), action: delete))
                    }
                }
                Divider()
            }
        }
        .background(Color.background)
    }
    
    private func delete() {
        print("delete article")
    }
}
