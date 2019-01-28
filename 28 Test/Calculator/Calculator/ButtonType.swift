//
//  ButtonType.swift
//  Calculator
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

enum ButtonType: String, CaseIterable {
    
    case ac = "AC"
    case plusMinus = "+/-"
    case percentage = "%"
    
    case division = "/"
    case multiply = "x"
    case subtract = "-"
    case addition = "+"
    case equalTo = "="
    case decimal = ","
    
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    
}

extension ButtonType {
    
    var displayText: String {
        switch self {
        case .ac: return "0"
        default: return self.rawValue
        }
    }
    
}
