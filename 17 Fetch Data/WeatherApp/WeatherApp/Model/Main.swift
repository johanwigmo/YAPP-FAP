//
//  Main.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

struct Main: Decodable {
    
    let temperature: Double?
    let pressure: Double?
    let humidity: Double?
    let tempMin: Double?
    let tempMax: Double?
    
    enum CodingKeys: String, CodingKey {
        case pressure, humidity
        
        case temperature = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        
    }
}
