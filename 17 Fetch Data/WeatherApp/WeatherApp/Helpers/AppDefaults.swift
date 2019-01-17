//
//  AppDefaults.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

class AppDefaults {
    
    enum Key: String {
        case cities = "cities"
    }
    
}

extension AppDefaults {
    
    static var cities: [String] {
        get {
            if let cities = UserDefaults.standard.array(forKey: Key.cities.rawValue) as? [String] {
                return cities
            } else {
                return []
            }
        }
        set { UserDefaults.standard.set(newValue, forKey: Key.cities.rawValue) }
    }
    
}

extension AppDefaults {
    
    class func addCity(id: String) {
        guard cities.firstIndex(of: id) == nil else { return }
        cities.append(id)
    }
    
    class func removeCity(id: String) -> String? {
        guard let index = cities.firstIndex(of: id) else { return nil }
        return cities.remove(at: index)
    }
    
}

