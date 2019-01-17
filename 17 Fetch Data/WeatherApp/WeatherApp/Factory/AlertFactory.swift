//
//  AlertFactory.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

class AlertFactory {
    
    class func addCity(completion: ((String?) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: "Add a city", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            completion?(alert.textFields?.first?.text)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        return alert
    }
    
}
