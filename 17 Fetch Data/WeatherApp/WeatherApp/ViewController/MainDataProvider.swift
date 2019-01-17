//
//  MainDataProvider.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

class MainDataProvider: NSObject {
    
    let manager: CityManager
    
    init(cityManager: CityManager) {
        self.manager = cityManager
        super.init()
    }
    
}

extension MainDataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.cityCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCityCell.identifier, for: indexPath) as? MainCityCell else {
            fatalError("Could not deqeue MainCityCell")
        }
        
        if let city = manager.city(at: indexPath.row) {
            cell.config(city: city)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        guard manager.removeCity(at: indexPath.row) != nil else { return }
    }
    
}

extension MainDataProvider: UITableViewDelegate {
    
    
}
