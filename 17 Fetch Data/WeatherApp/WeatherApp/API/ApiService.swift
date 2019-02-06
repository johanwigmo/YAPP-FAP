//
//  ApiService.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

typealias RequestCallbacks = ()
class ApiService {
    
    func request(method: String = "GET", endpoint: Endpoint, parameters: [String: Any]? = nil, completion: @escaping (Data?) -> Void) {
        
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = method
        if let params = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params as Any, options: .prettyPrinted)
        }
        
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                
                if let error = error {
                    print("ERROR - \(error.localizedDescription)")
                }
                completion(data)
            }
        }).resume()
    }
    
}
