//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var mock: MockCalculatorDelegate!
    var sut: Calculator!
    
    override func setUp() {
        super.setUp()
        
        mock = MockCalculatorDelegate()
        sut = Calculator()
        sut.delegate = mock
    }

    override func tearDown() {
        mock = nil
        sut = nil
        super.tearDown()
    }
    
    func testDisplayTextChange_ShouldCallDelegate() {
        sut.displayText = "Test"
        XCTAssertTrue(mock.didUpdateDisplayTextWasCalled)
    }
    
    func testFirstValueChange_ShouldUpdateDisplayText() {
        sut.firstValue = "1.5"
        XCTAssertEqual(sut.displayText, "1.5")
        sut.firstValue = ""
        XCTAssertEqual(sut.displayText, "0")
    }
    
    func testSecondValueChange_ShouldCallDelegate() {
        sut.secondValue = "Test"
        XCTAssertTrue(mock.didUpdateSecondValueWasCalled)
    }
    
    func testOperation_ShouldCallDelegate() {
        sut.operation = ButtonType.addition
        XCTAssertEqual(mock.didUpdateOperation, ButtonType.addition)
    }
    
    func testReset_ShouldResetValues() {
        sut.input(type: .ac)
        
        XCTAssertEqual(sut.firstValue, "")
        XCTAssertEqual(sut.secondValue, "")
        XCTAssertEqual(sut.displayText, "0")
        XCTAssertNil(sut.operation)
    }
    
    func testAddNumber_ShouldAddToValue() {
        sut.input(type: .zero)
        XCTAssertEqual(sut.displayText, "0")
        
        sut.input(type: .five)
        XCTAssertEqual(sut.displayText, "5")
        
        sut.input(type: .three)
        XCTAssertEqual(sut.displayText, "53")
    }
    
    func testAddNumber_ShouldAddToSecondValue() {
        sut.input(type: .five)
        sut.operation = ButtonType.addition
        sut.input(type: .six)
        
        XCTAssertEqual(sut.secondValue, "6")
    }
    
    func testAdd() {
        sut.input(type: ButtonType.two)
        sut.input(type: ButtonType.addition)
        sut.input(type: ButtonType.two)
        sut.input(type: ButtonType.equalTo)
        
        XCTAssertEqual(sut.displayText, "4")
    }

}

class MockCalculatorDelegate: CalculatorDelegate {
    
    var didUpdateDisplayTextWasCalled = false
    func calculatorDidUpdate(displayText: String) {
        didUpdateDisplayTextWasCalled = true
    }
    
    var didUpdateSecondValueWasCalled = false
    func calculatorDidUpdateSecondValue() {
        didUpdateSecondValueWasCalled = true
    }
    
    var didUpdateOperation: ButtonType?
    func calculatorDidUpdateOperation(with type: ButtonType?) {
        didUpdateOperation = type
    }
    
}
