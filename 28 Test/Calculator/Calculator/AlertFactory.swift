//
//  AlertFactory.swift
//  Calculator
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class AlertFactory {
    
    class func showNotAvailable(in vc: UIViewController) {
        let alert = UIAlertController(title: "Not Available", message: "The feature is not implemented yet", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
}
