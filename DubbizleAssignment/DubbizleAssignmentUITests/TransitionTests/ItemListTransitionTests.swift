//
//  ItemListTransition.swift
//  DubbizleAssignmentUITests
//
//  Created by nadeem akram on 11/23/20.
//

import XCTest

class ItemListTransitionTests: XCTestCase {

    private var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
    }
    
    func testItemDetailsNavigationFromItemList() {
        let myTable = app.tables.matching(identifier: "itemListTableView")
        let cell = myTable.cells.element(matching: .cell, identifier: "itemTableViewCell_0_0")
        
        let predicate = NSPredicate(format: "isHittable == true")
        let expectationEval = expectation(for: predicate, evaluatedWith: cell, handler: nil)
        let waiter = XCTWaiter.wait(for: [expectationEval], timeout: 10.0)
        XCTAssert(XCTWaiter.Result.completed == waiter, "Failed time out waiting for rate")
        
        cell.tap()
        
        let itemNavigationBar = app.navigationBars["Items"]
        XCTAssertTrue(itemNavigationBar.exists, "Item list navigation bar not exist.")
    }

}
