//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        label.text = "0"
    }
    
    private func setupButtons() {
        for button in buttons {
            button.backgroundColor = .clear
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            
            button.addTarget(self, action: #selector(input(_:)), for: .touchUpInside)
        }
    }

    @objc func input(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text, let type = ButtonType(rawValue: text) else { return }
        
        switch type {
        case .ac:
            label.text = type.rawValue
            // TODO: Clear data
            
        default: AlertFactory.showNotAvailable(in: self)
            
        }
        
    }
    
}

