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
    
    func city(at index: Int) -> City? {
        guard cityCount > index else { return nil }
        return cities[index]
    }
    
    func removeCity(at index: Int) -> City? {
        guard cityCount > index else { return nil }
        return cities.remove(at: index)
    }
}

class CityManager {
    
    static let shared = CityManager()
    
    private var cities: [City] = [] {
        didSet {
            AppDefaults.cities = cities
            // FIXME: delegate will spam in e.g. refreshWeatherForAllCities
            delegate?.cityManagerDidUpdate()
        }
    }
    
    weak var delegate: CityManagerDelegate?
    
    private init() {
        self.cities = AppDefaults.cities
        refreshWeatherForAllCities()
    }
    
    func addCity(by name: String) {
        guard !cities.contains(where: { $0.name == name }) else { return }
        
        ApiManager.shared.current.weather(city: name, success: { (city) in
            self.cities.append(city)

        }, failure: { (error) in
            print(error.description)
        })
        
    }
    
    func refreshWeatherForAllCities(completion: (() -> Void)? = nil) {
        for city in self.cities {
            weather(for: city)
        }
        // MARK: delegate will also tell when cities are updated
        completion?()
    }
    
    private func weather(for city: City) {
        ApiManager.shared.current.weather(id: city.id, success: { (newCity) in
            
            if let index = self.cities.firstIndex(of: city) {
                self.cities[index] = newCity
            } else {
                self.cities.append(newCity)
            }
            
        }, failure: { (error) in
            print(error.description)
        })
    }
    

    
}
