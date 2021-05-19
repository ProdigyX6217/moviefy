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
    
    let parameters = [
           "sort_by": "popularity.desc",
           "api_key": "d9d6752aa10f1010ea2ca4e780d8a8cd"
    ]
    
    let justApiKey = [
             "api_key": "d9d6752aa10f1010ea2ca4e780d8a8cd"
         ]
    
    
//    func getImageConfiguration(_ completion: @escaping (Result<MovieDBConfiguration>) -> ()) {
//        // Do statement to introduce a new scope and catch errors from it
//        do {
//            // Return a GET request for the /configuration endpoint with the api key as a parameter
//            let request = try Request.configureRequest(from: .config, with: justApiKey, and: .get, contains: nil)
//            session.dataTask(with: request) { (data, response, error) in
//                if let response = response as? HTTPURLResponse, let data = data {
//                    let result = Response.handleResponse(for: response)
//                    switch result {
//                    case .success:
//                        let result = try? JSONDecoder().decode(MovieDBConfiguration.self, from: data)
//                        completion(Result.success(result!))
//                    case let .failure(responseError):
//                        print(responseError)
//                        return
//                    }
//                }
//            }.resume()
//        } catch {
//            fatalError(NetworkError.badRequest.rawValue)
//        }
//    }
    
    func getPopularMovies(_ completion: @escaping (Result<[Movie]>) -> ()) {
        do{
          // Creating the request
            let request = try Request.configureRequest(from: .movies, with: parameters, and: .get, contains: nil)
                session.dataTask(with: request) { (data, response, error) in

                if let response = response as? HTTPURLResponse, let data = data {

                    let result = Response.handleResponse(for: response)
                    switch result {
                    case .success:
                        //Decode if successful
                        let result = try? JSONDecoder().decode(MovieApiResponse.self, from: data)
                        completion(Result.success(result!.movies))

                    case .failure:
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
    
}
