//
//  Movie.swift
//  14 List
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

enum Genre: String {
    case action = "action"
    case drama = "drama"
    case western = "western"
    case unknown = "unknown"
}

struct Movie {
    
    let title: String
    let rating: String
    let year: String
    let genre: Genre
    let actors: [String]
    
    var hasSeen: Bool
    
}
