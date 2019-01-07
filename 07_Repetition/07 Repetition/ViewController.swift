//
//  ViewController.swift
//  07 Repetition
//
//  Created by Johan Wigmo on 2019-01-07.
//  Copyright © 2019 Johan Wigmo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "First View Controller"
        
        myView.backgroundColor = UIColor.yellow
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        myView.addGestureRecognizer(gesture)
        
        myButton.setTitle("Navigation push", for: .normal)
    }
    
    @objc func viewTapped() {
        let alert = UIAlertController(title: "View Tapped", message: "You just tapped my view", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.isSecureTextEntry = false
            textField.placeholder = "Username"
        }
        
        alert.addTextField { (textField) in
            textField.isSecureTextEntry = true
            textField.placeholder = "Password"
        }
        
        let ok = UIAlertAction(title: "Login", style: .default) { (action) in
            print("You tried to log in")
            
            for textField in alert.textFields ?? [] {
                print(textField.text ?? "*Empty*")
            }
        }
        alert.addAction(ok)
        
        let cancel = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func myAction(_ sender: Any) {
        guard let button = sender as? UIButton, let title = button.title(for: .normal) else { return }
        print("Button: \(title) pressed")
    }
    
    @IBAction func modalAction() {
        performSegue(withIdentifier: "SegueToGreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GreenViewController {
            vc.buttonColor = UIColor.red
        }
    }
    
}

