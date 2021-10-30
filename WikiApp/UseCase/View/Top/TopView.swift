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
    let mock = Search(title: "電子デバイス工学", isbn: "9784627705623", author: "古川静二郎/萩田陽一郎/浅野種正", isPinned: true)
    
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
                    Image("AppIcon")
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
                    Image("AppIcon")
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

