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
    
    var calculator: Calculator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if calculator == nil {
            calculator = Calculator()
        }
        calculator?.delegate = self
        
        setupButtons()
        label.text = calculator?.displayText
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    private func setupButtons() {
        for button in buttons {
            button.backgroundColor = .clear
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            
            button.layer.borderColor = UIColor(red: 160/255, green: 255/255, blue: 170/255, alpha: 1.0).cgColor
            button.layer.borderWidth = 0
            
            button.addTarget(self, action: #selector(input(_:)), for: .touchUpInside)
        }
    }
    
    private func resetButtonBorders() {
        for button in buttons {
            button.layer.borderWidth = 0
        }
    }
    
    private func toggleBorder(for button: UIButton) {
        for b in buttons {
            if b == button {
                b.layer.borderWidth = b.layer.borderWidth == 0 ? 3 : 0
            } else {
                b.layer.borderWidth = 0
            }
        }
        
    }

    @objc func input(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text, let type = ButtonType(rawValue: text) else { return }
        
        calculator?.input(type: type, failure: {
            AlertFactory.showNotAvailable(in: self)
        })
    }
    
}

extension CalculatorViewController: CalculatorDelegate {
    
    func calculatorDidUpdateOperation(with type: ButtonType?) {
        guard let button = buttons.first(where: {
            if let text = $0.titleLabel?.text {
                return ButtonType(rawValue: text) == type
            } else {
                return false
            }
        }) else {
            resetButtonBorders()
            return
        }
        
        toggleBorder(for: button)
    }
    
    
    func calculatorDidUpdate(displayText: String) {
        label.text = displayText
    }
    
    func calculatorDidUpdateSecondValue() {
//        resetButtonBorders()
    }
    
}

