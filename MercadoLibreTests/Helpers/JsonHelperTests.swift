//
//  JsonHelperTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 6/04/21.
//

import XCTest
@testable import MercadoLibre

class JsonHelperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_gettingItemsResult_returnJsonData() {
        let itemsResult = JsonHelper.data(from: .itemsResult)
        XCTAssertNotNil(itemsResult)
    }
    
    func test_gettingSearchResult_returnJsonData() {
        let searchResult = JsonHelper.data(from: .searchResult)
        XCTAssertNotNil(searchResult)
    }

}
