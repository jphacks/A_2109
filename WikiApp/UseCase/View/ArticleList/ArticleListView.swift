//
//  ArticleListView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/28.
//

import SwiftUI

struct ArticleListView: View {
    
    enum Page: Int {
        case sort, filter
    }
    
    @State private var selected = Page.sort
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top, spacing: 20) {
                
                Image("nene")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Webを支える技術")
                        .font(.h3)
                        .fontWeight(.heavy)
                    
                    Text("著者")
                        .font(.body)
                        .padding(.bottom, 50)
                    
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {}){
                            Image(symbol: SFSymbol.bookmark)
                                .foregroundColor(.primary)
                        }
                        
                        Button(action: {}){
                            Image("amazon")
                        }
                    }
                }
                .padding(20)
            }
            Picker("", selection: $selected) {
                Text("ソート").tag(Page.sort)
                
                Text("フィルター").tag(Page.filter)
            }
            .pickerStyle(.segmented)
            
            Text("記事一覧")
                .font(.h3)
                .padding(10)
            
            List(1..<5) {item in
                VStack{
                    HStack(alignment: .bottom){
                        Text("おはよおおおおおおおおおおおおおこんにちはあああああああああああああさよならあああああああああああああああ")
                        
                        Spacer()
                        
                        Button(action: {}){
                            Image(symbol: SFSymbol.bookmark)
                                .padding(.top, 10)
                                .padding(.leading, 5)
                                .foregroundColor(.primary)
                        }
                        
                        Button(action: {}){
                            Image(symbol: SFSymbol.heart)
                                .padding(.top, 10)
                                .padding(.trailing, 5)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}
