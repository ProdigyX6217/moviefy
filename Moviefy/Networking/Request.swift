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
    case config = "configuration"
    case token = "authentication/token/new"
    case session = "authentication/session/new"
    case account = "account"
}

struct Request {
    
    public static let baseImageURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    
     static let headers = [
         "Accept":"Application/json",
         "Content-Type":"Application/json",
         "Authorizatoin":"e876d92222f5e25dbca0fa994d4bafad"
     ]
    
    static func configureRequest(from route: Route, with parameters: [String: Any], and method: HTTPMethod, contains body: Data?) throws -> URLRequest {

        // safely unwrap URL or return error
        guard let url = URL(string: "https://api.themoviedb.org/3/\(route.rawValue)") else { fatalError("Error while unwrapping url")}
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        try configureParametersAndHeaders(parameters: parameters, headers: headers, request: &request)
        return request
    }
    
    static func configureParametersAndHeaders(parameters: [String: Any]?,
                                                  headers: [String: String]?,
                                                  request: inout URLRequest) throws {
        do {
            if let headers = headers, let parameters = parameters {
                try Encoder.encodeParameters(for: &request, with: parameters)
                try Encoder.setHeaders(for: &request, with: headers)
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
    
    
}
