//
//  ArticleListView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/28.
//

import SwiftUI

struct ArticleListView: View {
    
    @State private var SorF = 0;
    
    var context: String
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top, spacing: 20) {
                
                Image("nene")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Webを支える技術")
                        .font(.h3)
                        .fontWeight(.heavy)
                        .padding(.trailing, 30)
                    
                    Text("著者")
                        .font(.body)
                        .padding(.trailing, 30)
                        .padding(.bottom, 50)
                    
                    HStack(alignment: .center, spacing: 10) {
                        Image(symbol: SFSymbol.plus)
                        
                        Image("amazon")
                    }
                }
                .padding(20)
            }
            Picker("", selection: $SorF) {
                Text("ソート").tag(0)
                
                Text("フィルター").tag(1)
            }
            .pickerStyle(.segmented)
            
            Text("記事一覧")
                .font(.h3)
                .padding(10)
            
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                HStack{
                    Image(symbol: SFSymbol.plus)
                        .padding(.top, 10)
                        .padding(.leading, 5)
                    
                    Spacer()
                    
                    Image(symbol: SFSymbol.heart)
                        .padding(.top, 10)
                    
                    Image(symbol: SFSymbol.edit)
                        .padding(.top, 10)
                    
                    Image(symbol: SFSymbol.xmark)
                        .padding(.top, 10)
                        .padding(.trailing, 5)
                }
            }
            Spacer()
        }
    }
}
