//
//  SearchResultDTOTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import XCTest
@testable import MercadoLibre

class SearchResultDTOTests: XCTestCase {

    var sut: SearchResult!
    var mockService: MockItemsService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockService = MockItemsService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_isNotNil() {
        guard let jsonData = mockService.jsonSearchResult.data(using: .utf8) else { return XCTFail("No data for test") }
        do {
            let itemDTO = try JSONDecoder().decode(SearchResultDTO.self, from: jsonData)
            sut = itemDTO
        } catch {
            XCTFail("\(error)")
        }
        XCTAssertNotNil(sut)
    }

}
