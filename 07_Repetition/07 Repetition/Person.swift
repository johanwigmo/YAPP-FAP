//
//  Person.swift
//  07 Repetition
//
//  Created by Johan Wigmo on 2019-01-07.
//  Copyright © 2019 Johan Wigmo. All rights reserved.
//

import UIKit

struct Person {
    
    let firstName: String
    let lastName: String
    let age: Int
    let image: UIImage?
    
}

extension Person {
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
}
