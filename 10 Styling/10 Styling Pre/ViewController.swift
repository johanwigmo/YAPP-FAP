//
//  ViewController.swift
//  10 Styling Pre
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topLabel.text = "hello_world".localized
        bottomLabel.text = "table".localized(from: "Text")
        
        rightImageView.image = UIImage(named: "flag_" + Locale.current.supportedLanguageCode)
    }

}

extension Locale {
    
    var supportedLanguageCode: String {
        let supported = ["en", "sv"]
        let languageCode = self.languageCode ?? "en"
        return supported.contains(languageCode) ? languageCode : "en"
    }
    
}

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(from table: String) -> String {
        return NSLocalizedString(self, tableName: table, bundle: Bundle.main, value: "", comment: "")
    }
    
}
