//
//  APIClient.swift
//  Moviefy
//
//  Created by Student Laptop_7/19_1 on 5/10/21.
//  Copyright © 2021 Adriana González Martínez. All rights reserved.
//

import Foundation

struct APIClient {
     static let shared = APIClient()
     let session = URLSession(configuration: .default)
 }
