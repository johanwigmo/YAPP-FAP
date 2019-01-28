//
//  CalculatorViewControllerTests.swift
//  CalculatorTests
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorViewControllerTests: XCTestCase {

    var sut: CalculatorViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = (UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! CalculatorViewController)
        
        _ = sut.view
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func performEqual(color: UIColor, expectedColor: UIColor, line: UInt = #line) {
        
        guard let expectedColor = expectedColor.rgb,
            let color = color.rgb
            else {
                XCTFail(line: line)
                return
        }
        
        XCTAssertEqual(color.red, expectedColor.red, "Red", line: line)
        XCTAssertEqual(color.green, expectedColor.green, "Green", line: line)
        XCTAssertEqual(color.blue, expectedColor.blue, "Blue", line: line)
        XCTAssertEqual(color.alpha, expectedColor.alpha, "Alpha", line: line)
    }
    
    func testTopView_ShouldNotBeNil() {
        XCTAssertNotNil(sut.topView)
    }
    
    func testLabel_ShouldNotBeNil() {
        XCTAssertNotNil(sut.label)
    }
    
    func testButtonsCount_ShouldEqual19() {
        XCTAssertEqual(sut.buttons.count, 19)
    }
    
    func testViewBackground_ShouldBeDark() {
        let expected = UIColor(red: 31/255, green: 33/255, blue: 36/255, alpha: 1.0)
        let color = sut.view.backgroundColor!
        
        performEqual(color: color, expectedColor: expected)
    }
    
    func testButtonStyle() {
        XCTAssertEqual(sut.buttons.first?.backgroundColor, UIColor.clear)
        XCTAssertEqual(sut.buttons.last?.backgroundColor, UIColor.clear)
        
        XCTAssertEqual(sut.buttons.first?.titleLabel?.textColor, UIColor.white)
        XCTAssertEqual(sut.buttons.last?.titleLabel?.textColor, UIColor.white)
        
        XCTAssertEqual(sut.buttons.first?.titleLabel?.font, UIFont.boldSystemFont(ofSize: 24))
    }

}
