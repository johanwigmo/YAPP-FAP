//
//  MovieFactory.swift
//  14 Lists Pre
//
//  Created by Johan Wigmo on 2019-01-12.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

class MovieFactory {
    
    class func generate() -> [Movie] {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else { return [] }
        guard let data = try? Data(contentsOf: url) else { return [] }
        guard let movies = try? JSONDecoder().decode([Movie].self, from: data) else { return [] }
        return movies
    }
    
}

extension Movie: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.genre = Genre(rawValue: try container.decode(String.self, forKey: .genre)) ?? .unknown
        self.year = try container.decode(String.self, forKey: .year)
        self.rating = try container.decode(String.self, forKey: .rating)
        self.actors = try container.decode([String].self, forKey: .actors)
        self.hasSeen = try container.decode(Bool.self, forKey: .hasSeen)
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case genre = "Genre"
        case year = "Year"
        case rating = "Rating"
        case actors = "Actors"
        case hasSeen = "Seen"
    }
    
}
