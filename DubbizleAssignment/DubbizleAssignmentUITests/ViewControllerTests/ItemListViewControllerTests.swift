//
//  ItemListViewControllerTests.swift
//  DubbizleAssignmentUITests
//
//  Created by nadeem akram on 11/23/20.
//

import XCTest

class ItemListViewControllerTests: XCTestCase {
    
    private var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
    }

    func testItemListElementsExistence() {
//        let itemNavigationBar = app.navigationBars["Items"]
//        XCTAssertTrue(itemNavigationBar.exists, "Items list navigation bar not exist.")

        let tablesQuery = app.tables
        let table = app.tables.matching(identifier: "itemListTableView")
        let firstCell = table.cells.element(matching: .cell, identifier: "itemTableViewCell_0_0")

        let predicate = NSPredicate(format: "isHittable == true")
        let expectationEval = expectation(for: predicate, evaluatedWith: firstCell, handler: nil)
        let waiter = XCTWaiter.wait(for: [expectationEval], timeout: 10.0)
        XCTAssert(XCTWaiter.Result.completed == waiter, "Failed time out waiting for rate")

        XCTAssertTrue(firstCell.exists, "first table view cell not exists.")
        let itemNavigationBar = app.navigationBars["Items"]
        XCTAssertTrue(itemNavigationBar.exists, "Item list navigation bar not exist.")

    }

}
