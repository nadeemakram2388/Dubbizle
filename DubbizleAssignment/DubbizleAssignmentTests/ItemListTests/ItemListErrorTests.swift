//
//  ItemListErrorTests.swift
//  DubbizleAssignmentTests
//
//  Created by nadeem akram on 11/23/20.
//

import XCTest

@testable import DubbizleAssignment

class ItemListErrorTests: XCTestCase {

    var itemListViewModel: ItemListViewModel!

    override func setUp() {
        let session = BadMockNetworkSession()
        let client = NetworkClient(session: session)
        itemListViewModel = ItemListViewModel(client: client)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testItemsAPIFailedResponse() {
        let expectation = self.expectation(description: "No error return by API.")
        
        itemListViewModel.error.bind { (error) in
            if error != nil {
                expectation.fulfill()
            }
        }
        
        itemListViewModel.getItems()
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

}
