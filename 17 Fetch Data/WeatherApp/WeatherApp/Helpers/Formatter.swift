//
//  Formatter.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-18.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import Foundation

class Formatter {
    
    static let shared = Formatter()
    
    lazy var date: DateFormatter = {
        return DateFormatter()
    }()
    
}


extension TimeInterval {
    
    func formattedDay() -> String {
        let date = Date(timeIntervalSince1970: self)
        
        let formatter = Formatter.shared.date
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    func formattedTime() -> String {
        let date = Date(timeIntervalSince1970: self)
        
        let formatter = Formatter.shared.date
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
}
