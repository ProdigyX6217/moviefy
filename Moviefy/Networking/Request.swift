//
//  Request.swift
//  Moviefy
//
//  Created by Student Laptop_7/19_1 on 5/10/21.
//  Copyright © 2021 Adriana González Martínez. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
     case get = "GET"
     case post = "POST"
     case put = "PUT"
     case patch = "PATCH"
     case delete = "DELETE"
 }

 public enum Route: String {
     case movies = "discover/movie"
 }

struct Request {
     static let headers = [
         "Accept":"Application/json",
         "Content-Type":"Applicatoin/json",
         "Authorizatoin":"e876d92222f5e25dbca0fa994d4bafad"
     ]
 }
