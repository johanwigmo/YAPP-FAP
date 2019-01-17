//
//  AppDefaults.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

class AppDefaults {
    
    enum Key: String, CaseIterable {
        case cities = "cities"
    }
    
    class func removeAll(exclude: [Key] = []) {
        for key in Key.allCases {
            if !exclude.contains(key) { remove(key: key) }
        }
    }
    
    class func remove(key: Key) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
}

extension AppDefaults {
    
    static var cities: [City] {
        get {
            if let cityStrings = UserDefaults.standard.array(forKey: Key.cities.rawValue) as? [String] {
                var cities = [City]()
                for text in cityStrings {
                    let components = text.components(separatedBy: "_")
                    guard let id = components.first, let name = components.last else { continue }
                    let city = City(name: name, id: Int(id)!)
                    cities.append(city)
                }
                return cities
            } else {
                return []
            }
        }
        set {
            var citiesToSave = [String]()
            for city in newValue {
                citiesToSave.append("\(city.id)_\(city.name)")
            }
            
            UserDefaults.standard.set(citiesToSave, forKey: Key.cities.rawValue)
        }
    }
    
}

extension AppDefaults {
    
    class func addCity(id: City) {
        
        guard cities.firstIndex(of: id) == nil else { return }
        cities.append(id)
    }
    
    class func removeCity(id: City) -> City? {
        guard let index = cities.firstIndex(of: id) else { return nil }
        return cities.remove(at: index)
    }
    
}

