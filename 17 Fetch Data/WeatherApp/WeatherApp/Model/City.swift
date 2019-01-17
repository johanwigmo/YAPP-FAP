//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

struct City: Equatable, Decodable {
    
    let name: String
    let id: Int
    
    var coordinate: Coordinate?
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
    var clouds: Clouds?
    var rain: Rain?
    var snow: Snow?
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case name, id, weather, main, wind, clouds, rain, snow
    }
    
    static func==(lhs: City, rhs: City) -> Bool {
        if lhs.name != rhs.name { return false}
        if lhs.id != rhs.id { return false}
        return true
    }
}
