//
//  Wind.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

struct Wind: Decodable {

    let speed: Double
    let degree: Int
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
    
}
