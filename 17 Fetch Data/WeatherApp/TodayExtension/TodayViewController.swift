//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Johan Wigmo on 2019-02-06.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var cityName: String? {
        didSet {
            topLabel.text = cityName
        }
    }
    
    var weatherText: String? {
        didSet {
            bottomLabel.text = weatherText
        }
    }
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topLabel.text = cityName
        bottomLabel.text = weatherText
        imageView.image = image
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        // Handle when user presses show more/show less
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        
        guard let city = AppDefaults.cities.first else {
            completionHandler(.noData)
            return
        }
        
        cityName = city.name
        
        ApiManager.shared.city.weather(id: city.id, success: { (newCity) in
            
            self.weatherText = newCity.weather?.first?.description
            self.image = newCity.weather?.first?.iconImage
            
            completionHandler(.newData)
        }) { (_) in
            self.weatherText = nil
            self.image = nil
            completionHandler(.failed)
        }
        
    }
    
}
