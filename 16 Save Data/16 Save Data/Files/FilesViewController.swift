//
//  FilesViewController.swift
//  16 Save Data
//
//  Created by Johan Wigmo on 2019-01-16.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class FilesViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    
    let fileManager = FileManager.default
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        load(self)
    }
    
    func plistUrl() -> URL? {
        let directoryUrl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return directoryUrl?.appendingPathComponent("data.plist")
    }
    
    @IBAction func save(_ sender: Any) {

        guard let first = firstTextField.text, first != "", let second = secondTextField.text, second != "" else {
            return
        }
        
        guard let plistUrl = plistUrl() else { return }
        
        let dict = ["first": first, "second": second]
    
        guard let data = try? PropertyListSerialization.data(fromPropertyList: dict, format: .xml, options: 0) else { return }
        
        
        do {
            try data.write(to: plistUrl)
            
            let alert = UIAlertController(title: "Success", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Thanks", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } catch {
            print("Error")
        }
        
    }
    
    @IBAction func load(_ sender: Any) {
        guard let plistUrl = plistUrl() else { return }
        
        guard let data = try? Data(contentsOf: plistUrl) else { return }
        
        if let optionalDict = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: String],
            let dict = optionalDict {
            
            
            if let first = dict["first"],
                let second = dict["second"] {
                
                resultLabel.text = first + " " + second
            }
        } else {
            print("Error with wierd unwrapping")
        }
        

    }
    
    
    
}
