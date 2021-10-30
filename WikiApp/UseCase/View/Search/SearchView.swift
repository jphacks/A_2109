//
//  SearchView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var loading = true
    @State private var isPresented = true
    
    @StateObject private var viewModel = SearchViewModel()
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                TextField("ここにisbnを入力", text: $viewModel.isbn)
                    .frame(idealWidth: 100 ,maxWidth: .infinity, idealHeight: 10, maxHeight: 40)
                    .padding(.leading, 16)
                    .background(Color.formBackground)
                    .cornerRadius(20)
                    .padding(.horizontal, 32)
                
                Button(action: { viewModel.getSearch() }) {
                    Image(symbol: SFSymbol.search)
                        .foregroundColor(Color.primary)
                }
            }
            .padding(32)
            
            VerticalSpacer(height: 64)
            
            switch viewModel.book {
            case .idle:
                EmptyView()
            case .loading:
                Text("検索中...")
                    .font(.h1)
                    .padding(.vertical, 32)
            case let .loaded(book):
                Text("検索結果")
                    .font(.serchText)
                    .padding(.vertical, 32)
                
                Button(action: { isPresented.toggle() }) {
                    URLImageView(viewModel: .init(url: "https://cover.openbd.jp/\(viewModel.isbn).jpg"))
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                }
                NavigationLink(destination: ArticleListPageView(bookInfo: book), isActive: $isPresented) {
                    EmptyView()
                }
            case .failed:
                Text("検索に失敗しました🙇‍♂️")
                    .font(.serchText)
                    .padding(.vertical, 32)
            }
            Spacer()
        }
    }
}


