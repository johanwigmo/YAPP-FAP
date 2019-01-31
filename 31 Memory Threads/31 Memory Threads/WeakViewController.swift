//
//  WeakViewController.swift
//  31 Memory Threads
//
//  Created by Johan Wigmo on 2019-01-30.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person? //
    deinit { print("Apartment \(unit) is being deinitialized") }
}

class WeakViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var stack: [Person?] = [] {
        didSet { textLabel.text = "\(stack.count)" }
    }
    
    @IBAction func add() {
        let john: Person? = Person(name: "John Appleseed \(stack.count)")
        let unit4A: Apartment? = Apartment(unit: "4A \(stack.count)")
        
        john?.apartment = unit4A
        unit4A?.tenant = john
        
        stack.append(john!)
    }
    
    @IBAction func remove() {
        _ = stack.popLast()
    }
    
}
