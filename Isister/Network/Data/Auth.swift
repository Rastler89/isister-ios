//
//  Auth.swift
//  Isister
//
//  Created by Daniel Molina on 20/3/24.
//

import Foundation

struct AuthResponse: Decodable {
    let token_type: String?
    let expires_in: Int?
    let access_token: String?
    let refresh_token: String?
}
