//
//  Weather.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}
