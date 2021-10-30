//
//  WikiAppView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

struct WikiAppView: View {
    @StateObject private var tabController = TabController()
    @State private var selectedTab = TabController.Tab.home
    
    var body: some View {
        TabView(selection: $tabController.currentTab) {
            TopPageView()
                .tabItem {
                    Label("ホーム", systemImage: SFSymbol.house.rawValue)
                }
                .tag(TabController.Tab.home)
            
            SearchPageView()
                .tabItem {
                    Label("さがす", systemImage: SFSymbol.search.rawValue)
                }
                .tag(TabController.Tab.search)
            
            PostBookPageView()
                .tabItem {
                    Label("新規登録", systemImage: SFSymbol.edit.rawValue)
                }
                .tag(TabController.Tab.edit)
            
            AccountpageView()
                .tabItem {
                    Label("アカウント", systemImage: SFSymbol.profile.rawValue)
                }
                .tag(TabController.Tab.account)
        }
    }
}
