//
//  IsisterApp.swift
//  Isister
//
//  Created by Daniel Molina on 19/3/24.
//

import SwiftUI

@main
struct IsisterApp: App {
    //let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ControlView()
        }
    }
}

struct ControlView: View {
    
    //@State private var hasCredentials = DataManager.shared.hasCredentials()
    //@StateObject private var manager: DataManager = DataManager()
    var hasCredentials: Bool = false
    var body: some View {
        if !hasCredentials {
            LoginView()
        } else {
            HomeView()
        }
    }
}
//.environment(\.managedObjectContext, persistenceController.container.viewContext)
