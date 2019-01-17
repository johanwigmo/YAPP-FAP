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
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = manager.city(at: indexPath.row).name
        
        return cell!
    }
    
}

extension MainDataProvider: UITableViewDelegate {
    
}
