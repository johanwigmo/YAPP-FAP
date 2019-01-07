//
//  DetailViewController.swift
//  07 Repetition
//
//  Created by Johan Wigmo on 2019-01-07.
//  Copyright © 2019 Johan Wigmo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = person?.fullName
        
        if let image = person?.image {
            imageView.image = image
        } else {
            imageView.backgroundColor = UIColor.gray
        }
    }

}
