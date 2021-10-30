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
    
    let mockText = ["電子デバイスの魅力に引き込まれた\nこれこそ神の書物アーメン", "CMOOSの境地に達した","softwareの基礎がここにあり","テストの重要性に気付かされた","仕事に込める生き様に感化","気づきの重要性を学んだ",]
    
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
                            
                            Button(action: {openAmazonProduct(withId: bookInfo.isbn)}){
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
    }
    
    private func openAmazonProduct(withId id: String) {
        guard let amazonWebURL = URL(string: "https://amzn.to/2MQC8Bz"),
              let amazonAppURL = URL(string: "https://www.amazon.co.jp/%E9%9B%BB%E5%AD%90%E3%83%87%E3%83%90%E3%82%A4%E3%82%B9%E5%B7%A5%E5%AD%A6-%E7%AC%AC2%E7%89%88-%E5%8F%A4%E5%B7%9D-%E9%9D%99%E4%BA%8C%E9%83%8E/dp/462770562X") else {
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
