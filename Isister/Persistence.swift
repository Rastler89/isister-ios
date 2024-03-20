//
//  Persistence.swift
//  Isister
//
//  Created by Daniel Molina on 19/3/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
}
