//
//  SFSymbol.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

enum SFSymbol: String {
    
    /// 􀓣
    case profile = "person.circle"
    
    /// 􀆄
    case xmark
    
    /// 􀊴
    case heart
    
    /// 􀊵
    case heartFill = "heart.fill"
    
    /// 􀊫
    case search = "magnifyingglass"
    
    /// 􀎞
    case house
    
    /// 􀈎
    case pencil = "square.and.pencil"
    
    /// 􀣋
    case gear = "gearshape"
    /// ＋
    case plus = "plus"
}

extension Image {
    init(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }
}