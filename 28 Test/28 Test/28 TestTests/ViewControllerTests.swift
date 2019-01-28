//
//  ViewControllerTests.swift
//  28 TestTests
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import XCTest

@testable import _8_Test

class ViewControllerTests: XCTestCase {

    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! UINavigationController
        sut = (nav.viewControllers.first as! ViewController)
        
        _ = sut.view
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTableView_IsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testAdd_ShouldIncreaseTableViewCount() {
        sut.textField.text = "First Row"
        sut.add()
        
        let result = sut.tableView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(result, 1)
    }

}
