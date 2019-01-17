//
//  MainCityCell.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

class MainCityCell: UITableViewCell {

    static let identifier = "MainCityCell"
    
    class func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        descriptionLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        blackView.layer.cornerRadius = 5
        blackView.clipsToBounds = true
    }
    
    func config(city: City) {
        nameLabel.text = city.name
        if let temperature = city.main?.temperature, let desc = city.weather?.first?.description {
            descriptionLabel.text = "\(temperature) °C - \(desc.capitalized)"
        } else {
            descriptionLabel.text = nil
        }
        
        weatherImageView.image = city.weather?.first?.iconImage
    }
    
}
