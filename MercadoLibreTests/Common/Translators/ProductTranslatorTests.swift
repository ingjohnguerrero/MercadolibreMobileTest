//
//  ProductTranslatorTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 7/04/21.
//

import XCTest
@testable import MercadoLibre

class ProductTranslatorTests: XCTestCase {
    
    var sut: ProductTranslator!
    var mockItemService: MockItemsService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ProductTranslator()
        mockItemService = MockItemsService(translator: sut)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_isNotNil() {
        XCTAssertNotNil(sut)
    }
    
    func test_withItemDTO_returnsProduct() {
        var product: Product?
        var error: Error?
        let getProductExpectation = expectation(description: "Getting product expectation")
        
        mockItemService.item(byId: "anyID") { (responseProduct, responseError) in
            product = responseProduct
            error = responseError
            getProductExpectation.fulfill()
        }
        
        wait(for: [getProductExpectation], timeout: 2)
        XCTAssertNil(error)
        XCTAssertNotNil(product)
        
    }
    
    func test_withItemDTOs_resultsInProductArray() {
        var products: [Product] = []
        var error: Error?
        let searhProductsExpectation = expectation(description: "searching for products expectation")
        
        mockItemService.items(byTerm: "anyTerm") { (responseProducts, responseError) in
            products = responseProducts
            error = responseError
            searhProductsExpectation.fulfill()
        }
        
        wait(for: [searhProductsExpectation], timeout: 2)
        XCTAssertNil(error)
        XCTAssertFalse(products.isEmpty)
    }

}
