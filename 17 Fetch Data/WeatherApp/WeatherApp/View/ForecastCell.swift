//
//  ForecastCell.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-18.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {

    static let identifier = "ForecastCell"
    
    class func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func config(forecast: Forecast) {
        
        dateLabel.text = forecast.timestamp.formattedTime()
        if let desc = forecast.weather?.first?.description, let temp = forecast.main?.temperature {
            descriptionLabel.text = desc.capitalized
            temperatureLabel.text = "\(Int(temp.rounded())) °C"
        } else {
            descriptionLabel.text = nil
            temperatureLabel.text = nil
        }
        
    }
    
}
