//
//  MovieApi.swift
//  17 Fetch Data
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

class MovieApi {
    
    static let shared = MovieApi()
    
    private init() {}
    
    func fetchMovies(success: (([Movie]) -> Void)? = nil, failure: ((String) -> Void)? = nil, always: @escaping () -> Void) {
        
        let url = URL(string: "https://raw.githubusercontent.com/johanwigmo/YAPP-FAP/master/14%20List/14%20List/Movies/movies.json")!
        let request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = "".data(using: .utf8)
//        request.cachePolicy = .useProtocolCachePolicy
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {

                if let error = error {
                    failure?(error.localizedDescription)
                }
                
                if let data = data {
                    if let movies = try? JSONDecoder().decode([Movie].self, from: data) {
                        success?(movies)
                    } else {
                        failure?("Could not decode data to movies")
                    }
                }
                
                always()
                
            }
        }
        
        task.resume()
        
    }
    
}
