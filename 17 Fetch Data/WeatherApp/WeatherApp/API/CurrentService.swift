//
//  CurrentService.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

class CurrentService {
    
    let api: ApiService
    
    init(apiService: ApiService) {
        self.api = apiService
    }
    
    func weather(city: String, success: @escaping (City) -> Void, failure: @escaping (ApiError) -> Void) {
        api.request(endpoint: .currentByCity(city: city)) { (data) in
            guard let data = data else {
                failure(ApiError.weatherCityName)
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(City.self, from: data)
                success(weather)
            } catch let error {
                print(error.localizedDescription)
                failure(ApiError.weatherCityName)
            }
        }
    }
    
    func weather(id: Int, success: @escaping (City) -> Void, failure: @escaping (ApiError) -> Void) {
        api.request(endpoint: .currentById(id: id)) { (data) in
            guard let data = data else {
                failure(ApiError.weatherCityName)
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(City.self, from: data)
                success(weather)
            } catch let error {
                print(error.localizedDescription)
                failure(ApiError.weatherCityName)
            }
        }
    }
    
}
