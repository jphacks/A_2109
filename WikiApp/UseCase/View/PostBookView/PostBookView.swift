//
//  PostBookView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/30.
//

import SwiftUI

struct PostBookView: View{
    @State var searchText = ""
    @State var loading = true
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 0) {
                TextField("ここにISBNを入力", text: $searchText)
                    .foregroundColor(.formText)
                    .frame(idealWidth: 100 ,maxWidth: .infinity, idealHeight: 10, maxHeight: 30)
                    .padding(.leading, 16)
                    .background(Color.formBackground)
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                    .padding(.top, 10)
                
                Button(action: { loading.toggle() }) {
                    Image(symbol: SFSymbol.search)
                        .foregroundColor(Color.primary)
                        .padding(.trailing, 32)
                        .padding(.top, 10)
                }
            }
            Button(action: {}){
                Text("カメラから入力")
                    .fontWeight(.thin)
                    .padding(.bottom, 50)
            }
                Text("検索結果")
                    .padding(32)
                    .font(.h2)
            
            HStack(alignment: .top, spacing: 40){
                Image("nene")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.leading, 64)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("タイトル")
                        .font(.h3)
                    
                    Text("著者")
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
            Spacer()
        }
    }
}
