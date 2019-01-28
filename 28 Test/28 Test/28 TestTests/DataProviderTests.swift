//
//  DataProviderTests.swift
//  28 TestTests
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import XCTest

@testable import _8_Test

class DataProviderTests: XCTestCase {
    
    var vc: ViewController!
    var sut: DataProviderMock!

    override func setUp() {
        super.setUp()
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! UINavigationController
        vc = (nav.viewControllers.first as! ViewController)
        
        sut = DataProviderMock(manager: DataManager())
        vc.dataProvider = sut
        
        _ = vc.view
    }
    
    func testNumberOfRowsCount_ShouldEqualDataCount() {
        XCTAssertEqual(vc.tableView.numberOfRows(inSection: 0), sut.manager.dataCount)
    }
    
    func testCellForRow_TextLabelText_ShouldEqualAddedText() {
        let expectation = "First"
        
        sut.manager.add(text: expectation)
        vc.tableView.reloadData()
        let cell = vc.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        let result = cell?.textLabel?.text
        
        XCTAssertEqual(result, expectation)
    }
    
    func testDidSelectRow_WasCalled() {
        sut.manager.add(text: "Test")
        vc.tableView.reloadData()
        
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(vc.tableView, didSelectRowAt: indexPath)
        
        XCTAssertTrue(sut.didSelectRowWasCalled)
    }

}

class DataProviderMock: DataProvider {
    
    var didSelectRowWasCalled = false
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        didSelectRowWasCalled = true
    }
    
}
