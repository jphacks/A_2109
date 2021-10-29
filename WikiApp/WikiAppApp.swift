//
//  WikiAppApp.swift
//  WikiApp
//
//  Created by tiking on 2021/10/26.
//

import SwiftUI

@main
struct WikiAppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            PostBookPageView()
        }
    }
}
