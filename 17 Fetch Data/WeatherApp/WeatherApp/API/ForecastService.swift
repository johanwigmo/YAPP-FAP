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
    
}
