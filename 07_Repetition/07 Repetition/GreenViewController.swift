//
//  GreenViewController.swift
//  07 Repetition
//
//  Created by Johan Wigmo on 2019-01-07.
//  Copyright © 2019 Johan Wigmo. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    var buttonColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myButton.setTitle("Close me", for: .normal)
        myButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        if let buttonColor = buttonColor {
            myButton.setTitleColor(buttonColor, for: .normal)
        }
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }

}
