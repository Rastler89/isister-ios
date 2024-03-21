//
//  Credential+CoreDataProperties.swift
//  Isister
//
//  Created by Daniel Molina on 21/3/24.
//
//

import Foundation
import CoreData


extension Credential {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Credential> {
        return NSFetchRequest<Credential>(entityName: "Credential")
    }

    @NSManaged public var access_token: String?
    @NSManaged public var expires_in: Int64
    @NSManaged public var refresh_token: String?
    @NSManaged public var token_type: String?

}

extension Credential : Identifiable {

}
