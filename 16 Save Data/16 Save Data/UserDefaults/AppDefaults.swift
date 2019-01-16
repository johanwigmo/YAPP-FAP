//
//  AppDefaults.swift
//  16 Save Data
//
//  Created by Johan Wigmo on 2019-01-16.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

class AppDefaults {
    
    enum Key: String, CaseIterable {
        case first = "first"
        case second = "second"
        case hasLaunchedBefore = "hasLaunchedBefore"
    }
    
    class func removeAll(exclude: [Key] = []) {
        for key in Key.allCases {
            if !exclude.contains(key) { remove(key: key) }
        }
    }
    
    class func remove(key: Key) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
}

struct Car {
    let tires: Double
    let regNumber: String
}

extension AppDefaults {
    
    static var first: String? {
        get { return UserDefaults.standard.string(forKey: Key.first.rawValue) }
        set { UserDefaults.standard.set(newValue, forKey: Key.first.rawValue) }
    }
    
    static var hasLaunchedBefore: Bool {
        get { return UserDefaults.standard.bool(forKey: Key.hasLaunchedBefore.rawValue) }
        set { UserDefaults.standard.set(newValue, forKey: Key.hasLaunchedBefore.rawValue) }
    }
    
    static var car: Car? {
        get {
            guard let regnr = UserDefaults.standard.string(forKey: "regnr") else { return nil }
            let tires = UserDefaults.standard.double(forKey: "tires")
            
            return Car(tires: tires, regNumber: regnr)
        }
        set {
            UserDefaults.standard.set(newValue?.regNumber, forKey: "regnr")
            UserDefaults.standard.set(newValue?.tires, forKey: "tires")
        }
    }
    
}

extension AppDefaults {
    
    class func toggleHasLaunchedBefore() {
        AppDefaults.hasLaunchedBefore = !AppDefaults.hasLaunchedBefore
    }
    
}
