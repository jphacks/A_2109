//
//  wikiAppApp.swift
//  wikiApp
//
//  Created by tiking on 2021/10/23.
//

import SwiftUI

@main
struct wikiAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
