//
//  ArticleListPageView.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/28.
//

import SwiftUI

struct ArticleListPageView: View {
    
    var body: some View {
        NavigationView {
            ArticleListView()
                .navigationTitle("Webを支える技術")
        }
    }
}
