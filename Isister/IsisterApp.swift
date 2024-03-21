//
//  IsisterApp.swift
//  Isister
//
//  Created by Daniel Molina on 19/3/24.
//

import SwiftUI

@main
struct IsisterApp: App {
    @StateObject private var manager: DataManager = DataManager()

    var body: some Scene {
        WindowGroup {
            ControlView().environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}

struct ControlView: View {
    
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
