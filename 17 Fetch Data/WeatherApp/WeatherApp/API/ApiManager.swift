//
//  ApiManager.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager()
    
    static let baseUrl = "https://api.openweathermap.org/data/2.5/"
    
    let api: ApiService
    let current: CurrentService
    let forecast: ForecastService
    
    init() {
        self.api = ApiService()
        self.current = CurrentService(apiService: api)
        self.forecast = ForecastService(apiService: api)
    }
    
}
