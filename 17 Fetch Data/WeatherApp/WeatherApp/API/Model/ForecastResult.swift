//
//  ForecastResult.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

struct ForecastResult: Decodable {
    
    let list: [Forecast]
    
}
