//
//  UserDefaultsViewController.swift
//  16 Save Data
//
//  Created by Johan Wigmo on 2019-01-16.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateLabel()
    }

    @IBAction func save(_ sender: Any) {
        
        guard let first = firstTextField.text, first != "", let second = secondTextField.text, second != "" else {
            return
        }
        
        AppDefaults.first = first
        UserDefaults.standard.set(second, forKey: "second")
        
        updateLabel()
    }

    func updateLabel() {
        guard
            let first = AppDefaults.first,
            let second = UserDefaults.standard.string(forKey: "second")
            else { return }
        
        resultLabel.text = first + " " + second
    }
}
