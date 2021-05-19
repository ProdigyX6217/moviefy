//
//  CreateSessionResponse.swift
//  Moviefy
//
//  Created by Student Laptop_7/19_1 on 5/18/21.
//  Copyright © 2021 Adriana González Martínez. All rights reserved.
//

import Foundation

struct CreateSessionResponse: Codable {
    let success: Bool
    let session_id: String
}
