//
//  Account.swift
//  Moviefy
//
//  Created by Student Laptop_7/19_1 on 5/18/21.
//  Copyright © 2021 Adriana González Martínez. All rights reserved.
//

import Foundation

struct Account: Codable {
    let id: Int
    let name: String?
    let username: String?
    
    var displayName: String {
        if let name = name, !name.isEmpty {
            return name
        }
        return username ?? "(Unknown)"
    }
}

