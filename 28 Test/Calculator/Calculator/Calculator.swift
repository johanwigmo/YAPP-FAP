//
//  Calculator.swift
//  Calculator
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

protocol CalculatorDelegate: class {
    func calculatorDidUpdate(displayText: String)
    func calculatorDidUpdateOperation(with type: ButtonType?)
    func calculatorDidUpdateSecondValue()
}

class Calculator {
    
    var displayText: String = "0" {
        didSet {
            delegate?.calculatorDidUpdate(displayText: displayText)
        }
    }
    
    var firstValue: String = "" {
        didSet {
            displayText = firstValue == "" ? "0" : firstValue
        }
    }
    
    var secondValue: String = "" {
        didSet {
            if secondValue != "" {
                displayText = secondValue
            }
            delegate?.calculatorDidUpdateSecondValue()
        }
    }
    
    var operation: ButtonType? = nil {
        didSet {
            if oldValue == operation {
                operation = nil
            }
            delegate?.calculatorDidUpdateOperation(with: operation)
        }
    }
    
    var delegate: CalculatorDelegate?
    
    func input(type: ButtonType, failure: (() -> Void)? = nil) {
        switch type {
        case .ac: reset()
            
        case .addition, .subtract, .multiply, .division: operation = type
            
        case .zero, .one, .two, .three, .four,
             .five, .six, .seven, .eight, .nine: addNumber(from: type)
            
        case .equalTo: calculate()
            
        default: failure?()
        }
    }
    
    private func reset() {
        firstValue = ""
        secondValue = ""
        operation = nil
    }
    
    private func addNumber(from type: ButtonType) {
        if operation == nil {
            addNumber(from: type, in: &firstValue)
        } else {
            addNumber(from: type, in: &secondValue)
        }
    }
    
    private func addNumber(from type: ButtonType, in value: inout String) {
        if value == "0" {
            value = type.rawValue
        } else {
            value.append(type.rawValue)
        }
    }
    
    private func calculate() {
        guard let first = Double(firstValue), let second = Double(secondValue), let operation = operation else {
            return
        }
        
        switch operation {
        case .addition:
            let value = add(value: second, to: first)
            firstValue = String(format: "%g", value)
            secondValue = ""
            
        default: break
        }
        
        self.operation = nil
        
    }
    
    private func add(value: Double, to: Double) -> Double {
        return to + value
    }
    
    private func subtract(value: Double, from: Double) -> Double {
        return 0
    }
    
}
