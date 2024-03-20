//
//  IsisterServer.swift
//  Isister
//
//  Created by Daniel Molina on 20/3/24.
//

import Foundation
import Alamofire

final class IsisterServer {
    static let shared = IsisterServer()
    
    private let kBaseUrl = "http://localhost/"
    private let kStatusOk = 200...299
    
    func authentication (_ username: String,_ password: String, success: @escaping(_ auth: AuthResponse) -> (), failure: @escaping(_ error: String) -> ()) {
        
        let url = "\(kBaseUrl)oauth/token"
        print(url)
        let auth = NewAuth(client_id: "2",
                              //client_secret: "qnAGG1IEYAfpe8fOlG7AR3hZvj8AZl1tVQG2fbdn",
                              client_secret: "5QXfF39FsbK3PLKQxRzWXthIrVRtIBveu34iteIC",
                              grant_type: "password",
                              password: password,
                              scope: "",
                              username: username)
        
        AF.request(url,method: .post, parameters: auth, encoder: JSONParameterEncoder.default).validate(statusCode:kStatusOk).responseDecodable(of: AuthResponse.self) {
            response in
            
            if let access = response.value {
                success(access)
            } else {
                print(response.value)
                failure("fail")
            }
        }
    }
}
