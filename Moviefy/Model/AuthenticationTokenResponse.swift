//
//  AuthenticationTokenResponse.swift
//  Moviefy
//
//  Created by Student Laptop_7/19_1 on 5/18/21.
//  Copyright © 2021 Adriana González Martínez. All rights reserved.
//

import Foundation

//We'll use some ugly snake case so that it's easily codable
struct AuthenticationTokenResponse: Codable {
    let success: Bool
    let expires_at: String
    let request_token: String
}

