//
//  TabController.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import Combine

final class TabController: ObservableObject {
    enum Tab: Int {
        case home, search, edit, account
    }
    
    @Published var currentTab = Tab.home
    
    func open(tab: Tab) {
        currentTab = tab
    }
}
