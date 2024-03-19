//
//  IsisterApp.swift
//  Isister
//
//  Created by Daniel Molina on 19/3/24.
//

import SwiftUI

@main
struct IsisterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
