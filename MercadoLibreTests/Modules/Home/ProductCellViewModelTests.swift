//
//  ProductCellViewModelTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 9/04/21.
//

import XCTest
@testable import MercadoLibre

class ProductCellViewModelTests: XCTestCase {
    
    var sut: ProductCellViewModel!
    let product = Product(id: "id", siteId: "siteId", title: "productTitle", price: 123456)


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
            sut = ProductCellViewModel(product: product)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_givenProduct_initObject() {
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.title, product.title)
    }
}
