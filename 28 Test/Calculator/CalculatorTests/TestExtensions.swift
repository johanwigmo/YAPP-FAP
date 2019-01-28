//
//  TestExtensions.swift
//  CalculatorTests
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import XCTest
import UIKit

extension XCTestCase {
    
    func colorsIsEqual(color: UIColor?, expected: UIColor?) -> Bool {
        if color?.rgb?.red != expected?.rgb?.red { return false }
        if color?.rgb?.green != expected?.rgb?.green { return false }
        if color?.rgb?.blue != expected?.rgb?.blue { return false }
        if color?.rgb?.alpha != expected?.rgb?.alpha { return false }
        return true
    }
    
}

extension UIColor {
    
    var rgb: (red:Int, green: Int, blue: Int, alpha: Int)? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return (red: Int(red * 255.0), green: Int(green * 255.0), blue: Int(blue * 255.0), alpha: Int(alpha * 255.0))
        } else {
            return nil
        }
    }
    
}
