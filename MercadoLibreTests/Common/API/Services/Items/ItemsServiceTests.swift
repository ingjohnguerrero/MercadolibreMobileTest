//
//  ItemsServiceTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import XCTest
@testable import MercadoLibre

class ItemsServiceTests: XCTestCase {

    var sut: ItemsService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockItemsService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_mockedResponse_isParsed() {
        let gettingItemsExpectation = expectation(description: "getting items expectation")
        var items: [Product]?
        var error: Error?

        sut.items(byTerm: "some") { (responseItems, responseError) in
            items = responseItems
            error = responseError
            gettingItemsExpectation.fulfill()
        }

        wait(for: [gettingItemsExpectation], timeout: 2)
        XCTAssertNil(error)
        XCTAssertNotNil(items)
        XCTAssertFalse(items?.isEmpty ?? true)
    }
    
    func test_mock_withItemId_resultsInItem() {
        let getItemByIdExpectation = expectation(description: "Getting item expectation")
        var item: Product?
        var error: Error?
        
        sut.item(byId: "id") { (responseItem, responseError) in
            item = responseItem
            error = responseError
            getItemByIdExpectation.fulfill()
        }
        
        wait(for: [getItemByIdExpectation], timeout: 10)
        XCTAssertNotNil(item)
        XCTAssertNil(error)
    }

}
