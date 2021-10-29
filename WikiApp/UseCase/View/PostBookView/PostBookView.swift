//
//  PostBookView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/30.
//

import SwiftUI

struct PostBookView: View{
    @State var isbn = ""
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                TextField("ISBN入力", text: $isbn)
                    .padding(.leading, 60)
                
                Button(action: {}){
                    Text("検索")
                        .fontWeight(.heavy)
                        .padding(.leading, 10)
                        .padding(.trailing, 50)
                }
                Spacer()
            }
            Button(action: {}){
                Text("カメラから入力")
                    .fontWeight(.thin)
            }
        }
    }
}
