//
//  ArticleListPageView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/28.
//

import SwiftUI

struct ArticleListPageView: View {
    
    let bookInfo: Search
    
    var body: some View {
        ArticleListView(bookInfo: bookInfo)
            .navigationTitle("Webを支える技術")
            .navigationBarTitleDisplayMode(.inline)
    }
}
