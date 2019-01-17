//
//  Token.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

class Token {
    
    static let shared = Token()
    
    
    private enum Key {
        static let openWeatherMapApi = "OpenWeatherMap_ApiKey"
    }
    
    private let dict: [String: String]
    
    private init() {
        guard
            let path = Bundle.main.path(forResource: "Token", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: String]
            else {
                self.dict = [:]
                return
        }
        self.dict = dict
    }
    
    var openWeatherMapApi: String { return dict[Key.openWeatherMapApi] ?? "" }
    
}
