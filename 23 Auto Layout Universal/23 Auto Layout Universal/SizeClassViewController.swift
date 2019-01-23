//
//  SizeClassViewController.swift
//  23 Auto Layout Universal
//
//  Created by Johan Wigmo on 2019-01-23.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class SizeClassViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateLabel()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateLabel()
    }
    
    func updateLabel() {
        
        if traitCollection.horizontalSizeClass == .regular {
            firstLabel.text = "FIRST"
            secondLabel.text = "SECOND"
        } else {
            firstLabel.text = "first"
            secondLabel.text = "second"
        }
        
    }
    
}
