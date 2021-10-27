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
            
            TopPageView()
                .tabItem {
                    Label("さがす", systemImage: SFSymbol.search.rawValue)
                }
                .tag(TabController.Tab.search)
            
            TopPageView()
                .tabItem {
                    Label("新規作成", systemImage: SFSymbol.pencil.rawValue)
                }
                .tag(TabController.Tab.edit)
            
            TopPageView()
                .tabItem {
                    Label("アカウント", systemImage: SFSymbol.profile.rawValue)
                }
                .tag(TabController.Tab.account)
        }
    }
}
