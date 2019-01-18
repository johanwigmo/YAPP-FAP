//
//  ForecastDataProvider.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

class ForecastDataProvider: NSObject {
    
    var viewModels: [ForecastViewModel] = []

}

extension ForecastDataProvider: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ForecastHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 60))
        header.titleText = viewModels[section].day
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels[section].forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastCell.identifier, for: indexPath) as? ForecastCell else {
            fatalError("Could not deqeue ForecastCell")
        }
        
        let forecast = viewModels[indexPath.section].forecasts[indexPath.row]
        cell.config(forecast: forecast)
        
        return cell
    }
    
}
