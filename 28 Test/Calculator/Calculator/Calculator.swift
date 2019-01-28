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
        
        case .decimal: addDecimal()
            
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
    
    private func addDecimal() {
        if operation == nil {
            addDecimal(in: &firstValue)
        } else {
            addDecimal(in: &secondValue)
        }
    }
    
    private func addDecimal(in value: inout String) {
        if value == "" {
            value.append("0.")
        } else {
            value.append(".")
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
            
        case .subtract:
            let value = subtract(value: second, from: first)
            firstValue = String(format: "%g", value)
            secondValue = ""
            
        case .multiply:
            let value = multiply(value: first, with: second)
            firstValue = String(format: "%g", value)
            secondValue = ""
            
            
        case .division:
            let value = divide(value: first, with: second)
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
        return from - value
    }
    
    private func multiply(value: Double, with: Double) -> Double {
        return value * with
    }
    
    private func divide(value: Double, with: Double) -> Double {
        return value / with
    }
    
}
