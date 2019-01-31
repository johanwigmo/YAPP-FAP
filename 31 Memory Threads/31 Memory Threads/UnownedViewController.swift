//
//  UnownedViewController.swift
//  31 Memory Threads
//
//  Created by Johan Wigmo on 2019-01-30.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: Int
    unowned let customer: Customer //
    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

class UnownedViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var stack: [Customer] = [] {
        didSet {
            textLabel.text = "\(stack.count)"
        }
    }
    
    @IBAction func add() {
        let john: Customer? = Customer(name: "John Appleseed \(stack.count)")
        john!.card = CreditCard(number: stack.count, customer: john!)
        
        stack.append(john!)
    }
    
    @IBAction func remove() {
        _ = stack.popLast()
    }
    
}
