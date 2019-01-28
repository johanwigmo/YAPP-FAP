//
//  DataManagerTests.swift
//  28 TestTests
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import XCTest

@testable import _8_Test

class DataManagerTests: XCTestCase {

    var sut: DataManager!
    
    override func setUp() {
        super.setUp()
        sut = DataManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    
    func testDataCount_Initillay_IsZero() {
        let expection = 0
        
        let result = sut.dataCount
        
        XCTAssertEqual(result, expection)
    }
    
    func testAdd_ShouldIncreaseCount() {
        sut.add(text: "First row")
        XCTAssertEqual(sut.dataCount, 1)
        
        sut.add(text: "Second row")
        XCTAssertEqual(sut.dataCount, 2)
    }
    
    func testAdd_ShouldNotIncreaseWhenDuplicates() {
        sut.add(text: "First row")
        sut.add(text: "first row")
        
        XCTAssertEqual(sut.dataCount, 1)
    }
    
    func testText_ShouldReturnPreviousAddedText() {
        let expection = "First row"
        
        sut.add(text: expection)
        let result = sut.text(for: 0)
        
        XCTAssertEqual(result, expection)
    }
    
    
    
}
