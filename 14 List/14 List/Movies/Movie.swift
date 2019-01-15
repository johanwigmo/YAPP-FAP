//
//  Movie.swift
//  14 List
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

enum Genre: String, CaseIterable {
    case action = "action"
    case drama = "drama"
    case western = "western"
    case unknown = "unknown"
    
    static func value(number: Int) -> Genre {
        switch number {
        case 0: return Genre.action
        case 1: return Genre.drama
        case 2: return Genre.western
        default: return Genre.unknown
        }
    }
    
    var numbervalue: Int {
        switch self {
        case .action: return 0
        case .drama: return 1
        case .western: return 2
        case .unknown: return 3
        }
    }
}

struct Movie: Equatable {
    
    let title: String
    let genre: Genre
    let year: String
    let rating: String
    let actors: [String]
    
    var hasSeen: Bool
    
}

extension Array where Iterator.Element == Movie {
    
    func filtered(with genre: Genre) -> [Movie] {
        return self.filter({ $0.genre == genre })
    }
    
}
