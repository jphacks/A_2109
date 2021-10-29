//
//  ArticleListViewModel.swift
//  WikiApp
//
//  Created by 小島大輝 on 2021/10/29.
//

import Foundation
import Combine

final class ArticleListViewModel: ObservableObject{
    @Published var bookName = ""
    @Published var bookAuthor = ""
    @Published var amazonLink = ""
}
