//
//  NetworkError.swift
//  Moviefy
//
//  Created by Student Laptop_7/19_1 on 5/10/21.
//  Copyright © 2021 Adriana González Martínez. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
     case parametersNil = "Parameters were nil"
     case encodingDailed = "Parameter Encoding failed"
     case decodingFailed = "Unable to decode data"
     case missingURL = "the URL is nil"
     case couldNotParse = "Unable to parse the JSON response"
     case noData = "Data is nil"
     case fragmentResponse = "Response's body has fragments"
     case authenticationError = "You must be authenticated"
     case badRequest = "Bad request"
     case pageNotFound = "Page not found"
     case failed = "Request failed"
     case serverError = "Server error"
     case noResponse = "No response"
     case success = "Success"
 }
