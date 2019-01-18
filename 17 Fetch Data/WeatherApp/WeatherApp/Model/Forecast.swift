//
//  Forecast.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

struct Forecast: Decodable {
    
    let timestamp: TimeInterval
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "dt"
        case weather, main, wind
    }
    
}
