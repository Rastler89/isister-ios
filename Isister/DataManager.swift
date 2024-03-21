//
//  DataManager.swift
//  Isister
//
//  Created by Daniel Molina on 21/3/24.
//

import CoreData
import Foundation

// Main data manager to handle the todo items
class DataManager: NSObject, ObservableObject {
    
    // Add the Core Data container with the model name
    let container: NSPersistentContainer = NSPersistentContainer(name: "Isister")
    
    // Default init method. Load the Core Data container
    override init() {
        super.init()
        container.loadPersistentStores { _, _ in }
    }
}
