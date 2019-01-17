//
//  ApiError.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

enum ApiError: Error {
    
    case weatherCityName
    case weatherCityId
    case weatherCityCoord
    
    case forecastCityName
    case forecastCityId
    case forecastCityCoord
    
    var description: String {
        switch self {
        case .weatherCityName: return "Could not fetch weather by name"
        case .weatherCityId: return "Could not fetch weather by id"
        case .weatherCityCoord: return "Could not fetch weather by coords"
        case .forecastCityName: return "Could not fetch forecast by name"
        case .forecastCityId: return "Could not fetch forecast by id"
        case .forecastCityCoord: return "Could not fetch forecast by coords"
        }
    }
    
}
