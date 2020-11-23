//
//  ItemListTests.swift
//  DubbizleAssignmentTests
//
//  Created by nadeem akram on 11/23/20.
//

import XCTest

@testable import DubbizleAssignment

class ItemListTests: XCTestCase {

    var itemListViewModel: ItemListViewModel!

    override func setUp() {
        let session = MockNetworkSession()
        let client = NetworkClient(session: session)
        itemListViewModel = ItemListViewModel(client: client)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testItemsListTitle() {
        XCTAssert(itemListViewModel.title == AppText.Items.localized, "Items list title mismatch.")
    }
        
    func testItemsAPISuccessResponse() {
        let expectation = self.expectation(description: "No response recevice from item list API.")
        
        itemListViewModel.error.bind { (error) in
            XCTAssert(error == nil, error!.localizedDescription)
        }
        
        itemListViewModel.itemData.bind { (itemData) in
            if itemData != nil {
                expectation.fulfill()
            }
        }
        itemListViewModel.getItems()
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testItemsAPIResultCount() {
        let expectation = self.expectation(description: "Invalid number of item returns by item list API.")
        itemListViewModel.error.bind { (error) in
            XCTAssert(error == nil, error!.localizedDescription)
        }
        itemListViewModel.itemData.bind { (itemData) in
            if self.itemListViewModel.items.count == 3 {
                expectation.fulfill()
            }
        }
        itemListViewModel.getItems()
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testItemsAPIObject() {
        
        let expectation = self.expectation(description: "Invalid number of items returns by items list API.")
        
        itemListViewModel.error.bind { (error) in
            XCTAssert(error == nil, error!.localizedDescription)
        }
        
        itemListViewModel.itemData.bind { (itemData) in
            if let item = self.itemListViewModel.items.first {
                XCTAssert(item.created_at == "2019-02-24 04:04:17.566515", "Created date is incorrect.")
                XCTAssert(item.price == "AED 5", "price is incorrect.")
                XCTAssert(item.name == "Notebook", "name is incorrect.")
                XCTAssert(item.uid == "4878bf592579410fba52941d00b62f94", "ui is incorrect.")
                expectation.fulfill()
            }
        }
        
        itemListViewModel.getItems()
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

}
