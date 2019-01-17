//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

struct CurrentWeather: Decodable {
    
    let coordinate: Coordinate?
    let weather: [Weather]?
    let main: Main?
    let wind: Wind?
    let clouds: Clouds?
    let rain: Rain?
    let snow: Snow?
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weather, main, wind, clouds, rain, snow
    }
}
