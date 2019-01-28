//
//  ButtonTypeTests.swift
//  CalculatorTests
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import XCTest
@testable import Calculator

class ButtonTypeTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCaseCount_ShouldEqual19() {
        XCTAssertEqual(ButtonType.allCases.count, 19)
    }
    
    func testDisplayText() {
        XCTAssertEqual(ButtonType.ac.displayText, "0")
    }
    
}
