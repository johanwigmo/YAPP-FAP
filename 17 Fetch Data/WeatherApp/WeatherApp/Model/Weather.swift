//
//  Weather.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

struct Weather: Decodable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}

extension Weather {
    
    var iconImage: UIImage? {
        guard let url = URL(string: "https://openweathermap.org/img/w/\(icon).png") else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }
    
}
