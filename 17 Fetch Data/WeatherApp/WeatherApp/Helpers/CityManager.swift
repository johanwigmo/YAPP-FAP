//
//  CityManager.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

protocol CityManagerDelegate: class {
    func cityManagerDidUpdate()
}

extension CityManager {
    
    var cityCount: Int { return cities.count }

}

class CityManager {
    
    static let shared = CityManager()
    
    private var cities: [City] = [] {
        didSet {
            AppDefaults.cities = cities
            delegate?.cityManagerDidUpdate()
        }
    }
    
    weak var delegate: CityManagerDelegate?
    
    private init() {
        self.cities = AppDefaults.cities
        // TODO: Fetch current weather for all cities
    }
    
    func addCity(by name: String) {
        guard !cities.contains(where: { $0.name == name }) else { return }
        
        ApiManager.shared.current.weather(city: name, success: { (city) in
            self.cities.append(city)

        }, failure: { (error) in
            print(error)
        })
        
    }
    
    func city(at index: Int) -> City {
        return cities[index]
    }
    
}
