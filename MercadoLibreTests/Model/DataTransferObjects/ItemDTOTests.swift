//
//  ItemDTOTests.swift
//  Tests iOS
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import XCTest
@testable import MercadoLibre

class ItemDTOTests: XCTestCase {

    var sut: ItemDTO!
    var mockService: MockItemsService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockService = MockItemsService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_isNotNil() {
        guard let jsonData = mockService.itemDetailsJsonData else { return XCTFail("No data for test") }
        do {
            let itemDTO = try JSONDecoder().decode([ItemResultDTO].self, from: jsonData)
            sut = itemDTO.first?.item
        } catch {
            XCTFail("\(error)")
        }
        XCTAssertNotNil(sut)
    }

}
