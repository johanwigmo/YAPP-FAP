//
//  City.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

struct City: Decodable {
    
    let coordinate: Coordinate
    let weather: Weather
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let rain: Rain
    let snow: Snow
    
}


