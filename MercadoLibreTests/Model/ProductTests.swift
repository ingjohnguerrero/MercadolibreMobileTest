//
//  ProductTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 6/04/21.
//

import XCTest
@testable import MercadoLibre

class ProductTests: XCTestCase {

    var sut: Product!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Product(id: "id", siteId: "siteId", title: "Product title", price: 10000, thumbnailUrl: "thumbnail")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_init_isNotNil() {
        XCTAssertNotNil(sut)
    }

}
