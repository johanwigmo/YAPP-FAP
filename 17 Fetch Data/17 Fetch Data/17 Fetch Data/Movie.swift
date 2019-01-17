//
//  Movie.swift
//  17 Fetch Data
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let title: String
    let year: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
    }
    
}
