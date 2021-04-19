//
//  AlamofireItemServiceTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import XCTest
@testable import MercadoLibre

class AlamofireItemServiceTests: XCTestCase {

    var sut: AlamofireItemService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = AlamofireItemService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_gettingItems_byTerm_isNotEmpty() {
        let gettingItemsExpectation = expectation(description: "getting items expectation")
        var items: [Product]?
        var error: Error?

        sut.items(byTerm: "iPhone") { (responseItems, responseError) in
            items = responseItems
            error = responseError
            gettingItemsExpectation.fulfill()
        }

        wait(for: [gettingItemsExpectation], timeout: 2)
        XCTAssertNil(error)
        XCTAssertNotNil(items)
        XCTAssertFalse(items?.isEmpty ?? true)
    }
    
    func test_get_nextResultsPage_returnsDifferentResults() {
        let gettingItemsExpectation = expectation(description: "getting items expectation")
        var items: [Product]?
        var error: Error?
        
        sut.items(byTerm: "iPhone") { (responseItems, responseError) in
            error = responseError
            items = responseItems
            
            self.sut.nextPageItems(offset: 10) {responseNextItems, responseError in
                error = responseError
                items? += responseNextItems
                gettingItemsExpectation.fulfill()
            }
        }

        wait(for: [gettingItemsExpectation], timeout: 2)
        XCTAssertNil(error)
        XCTAssertNotNil(items)
        XCTAssertFalse(items?.isEmpty ?? true)
        XCTAssertTrue(items?.count ?? 0 > Contants.itemsPerPage )
    }
    
    func test_item_givenAValidID_resultsInAnItem() {
        let getItemDetailsExpectation = expectation(description: "getting item details")
        var item: Product?
        var error: Error?
        
        sut.item(byId: "MCO613074938") { (responseItem, responseError) in
            item = responseItem
            error = responseError
            getItemDetailsExpectation.fulfill()
        }
        
        wait(for: [getItemDetailsExpectation], timeout: 2)
        XCTAssertNotNil(item)
        XCTAssertNil(error)
    }

}
