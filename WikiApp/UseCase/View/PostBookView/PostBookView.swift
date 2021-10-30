//
//  PostBookView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/30.
//

import SwiftUI

struct PostBookView: View{
    @State var searchText = ""
    @State private var isShowCamera = false
    @State private var isPresented = false
    @State private var flag = false
    
    
    @StateObject private var viewModel = PostBookViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 0) {
                TextField("ここにISBNを入力", text: $searchText)
                    .frame(idealWidth: 100 ,maxWidth: .infinity, idealHeight: 10, maxHeight: 30)
                    .padding(.leading, 16)
                    .background(Color.formBackground)
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                Button(action: { flag.toggle() }) {
                    Image(symbol: SFSymbol.search)
                        .foregroundColor(Color.primary)
                        .padding(.trailing, 32)
                }
            }
            Button(action: { isShowCamera.toggle() }){
                Text("カメラから入力")
                    .fontWeight(.thin)
                    .padding(.bottom, 50)
            }
            .fullScreenCover(isPresented: $isShowCamera, onDismiss: nil) {
                CameraView(isActive: $isShowCamera)
            }
            
            if flag {
                HStack(alignment: .top, spacing: 40){
                    URLImageView(viewModel: .init(url: "https://cover.openbd.jp/9784764905092.jpg"))
                        .frame(width: 80, height: 80)
                        .padding(.leading, 64)
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("ソフトウェア工学")
                            .font(.h3)
                        
                        Text("著者: 岸知二／著 野田夏子/著")
                            .font(.body)
                    }
                    Spacer()
                }
                Button(action: {}){
                    Text("追加する")
                        .foregroundColor(.white)
                        .frame(width: 80, height: 30)
                        .background(Color.primary)
                        .cornerRadius(10)
                        .padding(40)
                }
            }
            
            //            switch viewModel.book {
            //            case .idle:
            //                EmptyView()
            //            case .loading:
            //                Text("検索中...")
            //                    .font(.h1)
            //                    .padding(.vertical, 32)
            //            case let .loaded(book):
            //
            //                HStack(alignment: .top, spacing: 40){
            //                    URLImageView(viewModel: .init(url: "https://cover.openbd.jp/\(viewModel.isbn).jpg"))
            //                        .frame(width: 80, height: 80)
            //                        .padding(.leading, 64)
            //
            //                    VStack(alignment: .leading, spacing: 10){
            //                        Text("タイトル")
            //                            .font(.h3)
            //
            //                        Text("著者")
            //                            .font(.body)
            //                    }
            //                    Spacer()
            //                }
            //                Button(action: { viewModel.registBook(book: book[0])}){
            //                    Text("追加する")
            //                        .foregroundColor(.white)
            //                        .frame(width: 80, height: 30)
            //                        .background(Color.primary)
            //                        .cornerRadius(10)
            //                        .padding(40)
            //                }
            //            case .failed:
            //                Text("登録に失敗しました🙇‍♂️")
            //                    .font(.serchText)
            //                    .padding(.vertical, 32)
        }
        
        Spacer()
    }
}
