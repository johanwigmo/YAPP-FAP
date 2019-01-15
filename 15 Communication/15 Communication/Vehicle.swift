//
//  Vehicle.swift
//  15 Communication
//
//  Created by Johan Wigmo on 2019-01-15.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit


protocol Vehicle {
    
    var color: UIColor { get set }
    var tires: Int { get }
    var name: String { get set }
    
    func fullName() -> String
}

struct Car: Vehicle {
    
    var color: UIColor
    var tires: Int { return 4 }
    var name: String
    
    var regNumber: String
    
    func fullName() -> String {
        return "\(name) (\(regNumber))"
    }
    
}

struct Bike: Vehicle {
    
    var color: UIColor
    var tires: Int { return 2 }
    var name: String
    
    func fullName() -> String {
        return name
    }
}
