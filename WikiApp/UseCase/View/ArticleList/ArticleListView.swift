//
//  ArticleListView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/28.
//

import SwiftUI

struct ArticleListView: View {
    
    @State private var isPined = false
    @State private var isBookMark = false
    @State private var isLike = false
    
    @StateObject private var viewModel = ArticleListViewModel()
    
    @State private var isPresented = false
    
    let bookInfo: Search
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .top, spacing: 24) {
                    
                    URLImageView(viewModel: .init(url: "https://cover.openbd.jp/\(bookInfo.isbn).jpg"))
                        .frame(width: 80, height: 80)
                        .padding(.top, 24)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("著者: \n\(bookInfo.author)")
                            .font(.body)
                            .padding(.bottom, 32)
                        
                        HStack(alignment: .center, spacing: 16) {
                            
                            PinedButton(isPined: bookInfo.isPinned)
                            
                            Button(action: {openAmazonProduct(withId: bookInfo.amazonLink)}){
                                Image("amazon")
                            }
                        }
                    }
                    .padding(24)
                }
                
                HStack(alignment: .top, spacing: 0) {
                    Text("記事一覧")
                        .font(.h3)
                    Spacer()
                }
                .padding(10)
                
                Divider()
                
                switch viewModel.articles {
                case .idle, .loading:
                    ProgressView()
                        .padding(.top, 32)
                    
                case let .loaded(articles):
                    ScrollView {
                        ForEach(articles.articles) { article in
                            Text(article.context)
                                .padding(.bottom, 4)
                            
                            HStack(alignment: .top, spacing: 24) {
                                Spacer()
                                BookMarkButton(isBookMark: article.isBookmarked)
                                LikeButton(isLike: article.isLiked)
                            }
                            
                            Divider()
                        }
                    }
                    .background(Color.background)
                    
                case .failed:
                    Text("記事の取得に失敗しました🙇‍♂️")
                        .font(.serchText)
                        .padding(.vertical, 32)
                }
                
                Spacer()
            }
            
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                HStack(alignment: .top, spacing: 0) {
                    Spacer()
                    Button(action: { isPresented.toggle() }) {
                        Image(symbol: SFSymbol.pencil)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.primary)
                            .cornerRadius(5)
                            .padding(16)
                    }
                    .fullScreenCover(isPresented: $isPresented, onDismiss: nil) {
                        PostArticlePageView()
                    }
                }
            }
        }
        .onFirstAppear {
            viewModel.getArticleList(bookID: bookInfo.id)
        }
    }
    
    private func openAmazonProduct(withId link: String) {
        guard let amazonWebURL = URL(string: "https://amzn.to/2MQC8Bz"),
              let amazonAppURL = URL(string: link) else {
                  return
              }
        if UIApplication.shared.canOpenURL(amazonAppURL) {
            UIApplication.shared.open(amazonAppURL, options: [:], completionHandler: nil)
        }
        else if UIApplication.shared.canOpenURL(amazonWebURL) {
            UIApplication.shared.open(amazonWebURL, options: [:], completionHandler: nil)
        }
    }
    
    private struct PinedButton: View {
        @State var isPined: Bool
        
        var body: some View {
            Button(action: { isPined.toggle() }){
                ZStack {
                    Image(symbol: SFSymbol.bookmark)
                        .foregroundColor(.primary)
                        .isHidden(isPined)
                    
                    Image(symbol: SFSymbol.bookmarkFill)
                        .foregroundColor(.primary)
                        .isHidden(!isPined)
                }
            }
        }
    }
}
