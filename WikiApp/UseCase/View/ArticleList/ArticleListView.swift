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
    
    @State private var isPresented = false
    
    private let name = "山下陽平"
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .top, spacing: 24) {
                    
                    Image("nene")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.top, 24)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Webを支える技術")
                            .font(.h3)
                            .fontWeight(.heavy)
                        
                        Text("著者: \(name)")
                            .font(.body)
                            .padding(.bottom, 32)
                        
                        HStack(alignment: .center, spacing: 16) {
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
                            
                            Button(action: {openAmazonProduct(withId: "4774142042")}){
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
                    ForEach(0..<5) { num in
                        Text("おはよおおおおおおおおおおおおおこんにちはあああああああああああああさよならあああああああああああああああおはよおおおおおおおおおおおおおこんにちはあああああああああああああさよならあああああああああああああ")
                            .padding(.bottom, 4)
                            .tag(num)
                        
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
             let amazonAppURL = URL(string: "com.amazon.mobile.shopping://www.amazon.com/products/\(id)/") else {
                 return
       }
       if UIApplication.shared.canOpenURL(amazonAppURL) {
                UIApplication.shared.open(amazonAppURL, options: [:], completionHandler: nil)
       }
       else if UIApplication.shared.canOpenURL(amazonWebURL) {
                UIApplication.shared.open(amazonWebURL, options: [:], completionHandler: nil)
       }
    }
    
    private struct BookMarkButton: View {
        @State var isBookMark: Bool
        
        var body: some View {
            Button(action: { isBookMark.toggle()  }) {
                ZStack(alignment: .trailing) {
                    Image(symbol: SFSymbol.bookmark)
                        .foregroundColor(.primary)
                        .padding(.bottom, 4)
                        .isHidden(isBookMark)
                    
                    Image(symbol: SFSymbol.bookmarkFill)
                        .foregroundColor(.primary)
                        .padding(.bottom, 4)
                        .isHidden(!isBookMark)
                }
            }
        }
    }
    
    private struct LikeButton: View {
        @State var isLike: Bool
        
        var body: some View {
            Button(action: { isLike.toggle() }) {
                ZStack(alignment: .trailing) {
                    Image(symbol: SFSymbol.heart)
                        .foregroundColor(.primary)
                        .padding(.trailing, 16)
                        .isHidden(isLike)
                    
                    Image(symbol: SFSymbol.heartFill)
                        .foregroundColor(.primary)
                        .padding(.trailing, 16)
                        .isHidden(!isLike)
                }
            }
        }
    }
}
