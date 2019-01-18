//
//  ForecastService.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

class ForecastService {
    
    let api: ApiService
    
    init(apiService: ApiService) {
        self.api = apiService
    }
    
    func fetch(id: Int, success: @escaping ([Forecast]) -> Void, failure: @escaping (ApiError) -> Void) {
        
        api.request(endpoint: .forecastById(id: id)) { (data) in
            guard let data = data else {
                failure(ApiError.forecastCityId)
                return
            }
            
            do {
                let forecast = try JSONDecoder().decode(ForecastResult.self, from: data)
                success(forecast.list)
            } catch let error {
                print(error.localizedDescription)
                failure(ApiError.forecastCityId)
            }
        }
        
    }
    
}
