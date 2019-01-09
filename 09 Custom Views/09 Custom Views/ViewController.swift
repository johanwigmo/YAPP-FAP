//
//  ViewController.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, StyledButtonDelegate {

    @IBOutlet weak var titleTextField: TitleTextField!
    @IBOutlet weak var button: StyledButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.style = .cancel
        button.delegate = self
    }
    
    func didTap() {
        print(#function)
        print("Button Tapped")
    }
    
}
