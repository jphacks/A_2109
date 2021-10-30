//
//  TopView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

struct TopView: View {
    
    @StateObject private var viewModel = TopViewModel()
    @State var flag = false
    let mock = Search(title: "電子デバイス工学", isbn: "9784627705623", author: "古川静二郎/萩田陽一郎/浅野種正", isPinned: true, imageLink: "https://cover.openbd.jp/9784627705623.jpg", amazonLink: "https://www.amazon.co.jp/%E9%9B%BB%E5%AD%90%E3%83%87%E3%83%90%E3%82%A4%E3%82%B9%E5%B7%A5%E5%AD%A6-%E7%AC%AC2%E7%89%88-%E5%8F%A4%E5%B7%9D-%E9%9D%99%E4%BA%8C%E9%83%8E/dp/462770562X", id: 1)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("ピン留め本一覧")
                .font(.h3)
                .padding(.horizontal, 16)
            
            VerticalSpacer(height: 32)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 48) {
                    Image("icon1")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Button(action: { flag.toggle()}) {
                        Image("icon2")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: ArticleListPageView(bookInfo: mock), isActive: $flag) {
                        EmptyView()
                    }
                    Image("icon3")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("icon4")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
            }
            
            VerticalSpacer(height: 64)
            
            Divider()
            
            VerticalSpacer(height: 64)
            
            Text("おすすめ本一覧")
                .font(.h3)
                .padding(.horizontal, 16)
            
            VerticalSpacer(height: 32)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 48) {
                    Image("icon1")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("icon2")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("icon3")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("icon4")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
            }
        }
        .onFirstAppear {
            viewModel.getTop()
        }
    }
}

