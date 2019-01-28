//
//  _8_TestUITests.swift
//  28 TestUITests
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import XCTest

class _8_TestUITests: XCTestCase {

    override func setUp() {
        XCUIApplication().launch()
    }

    func testExample() {
        
        let app = XCUIApplication()
        let textfield = app.textFields["TextField"]
        let addButton = app.buttons["Add"]
        
        textfield.tap()
        textfield.typeText("First Row")
        addButton.tap()
        
        textfield.tap()
        textfield.typeText("Second Row")
        addButton.tap()
        
        let table = app.tables
        let count = table.cells.count
        
        XCTAssertEqual(count, 2)
        
        let cell = table.staticTexts["Second Row"]
        XCTAssertTrue(cell.exists)
    }
    
    func testExampleTwo() {
        
        let app = XCUIApplication()
        let textfield = app.textFields["TextField"]
        let addButton = app.buttons["Add"]
        
        textfield.tap()
        textfield.typeText("Hej Hej")
        addButton.tap()
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Hej Hej"]/*[[".cells.staticTexts[\"Hej Hej\"]",".staticTexts[\"Hej Hej\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        let text = app.staticTexts["Hej Hej"]
        
        XCTAssertTrue(text.exists)
        
    }

}
