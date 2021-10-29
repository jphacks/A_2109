//
//  PostBookPageView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/30.
//

import SwiftUI

struct PostBookPageView: View{
    var body: some View{
        NavigationView{
            PostBookView()
                .navigationTitle("書籍登録")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
