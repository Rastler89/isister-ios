//
//  NewAuth.swift
//  Isister
//
//  Created by Daniel Molina on 20/3/24.
//

import Foundation

struct NewAuth: Encodable {
    let client_id: String?
    let client_secret: String?
    let grant_type: String?
    let password: String?
    let scope: String?
    let username: String?
}
