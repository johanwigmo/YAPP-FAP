//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var city: City?
    
    private var dataProvider: ForecastDataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        
        dataProvider = ForecastDataProvider()
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        tableView.register(ForecastCell.getNib(), forCellReuseIdentifier: ForecastCell.identifier)

        guard let city = city else {
            return
        }
        
        title = city.name
        
        ApiManager.shared.forecast.fetch(id: city.id, success: { (forecasts) in
            self.dataProvider?.viewModels = self.createForecastViewModels(from: forecasts)
            
            self.tableView.reloadData()
            
        }, failure: { (error) in
            print(error.localizedDescription)
        })
        
    }
    
    private func createForecastViewModels(from forecasts: [Forecast]) -> [ForecastViewModel] {
        var viewModels = [ForecastViewModel]()
        
        for forecast in forecasts {
            if let index = viewModels.firstIndex(where: { $0.day == forecast.timestamp.formattedDay() }) {
                viewModels[index].forecasts.append(forecast)
            } else {
                viewModels.append(ForecastViewModel(day: forecast.timestamp.formattedDay(), forecasts: [forecast]))
            }
        }
        
        return viewModels
    }
    
    
    private func addBackground() {
        view.insertSubview(ViewFactory.background(to: view), at: 0)
    }
    

}
