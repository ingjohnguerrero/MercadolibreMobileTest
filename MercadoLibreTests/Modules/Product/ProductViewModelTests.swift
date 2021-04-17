//
//  ProductViewModelTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 16/04/21.
//

import XCTest
@testable import MercadoLibre

class ProductViewModelTests: XCTestCase {
    
    var sut: ProductViewModel!
    let productView = MockProductView(productId: "productId")
    let itemService = MockItemsService()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        itemService.isErrorResponse = false
        sut = ProductViewModel(view: productView, service: itemService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_notResultInNil() {
        XCTAssertNotNil(sut)
    }
    
    func test_whenGivenView_setInstanceView() {
        XCTAssertTrue(sut.productView is MockProductView)
    }
    
    func test_currentState_whenGivenProductId_isLoadingStating() {
        sut.loadProductById()
        
        XCTAssertTrue(sut.currentState is ProductStandByState)
    }
    
    func test_currentState_whenEmptyProduct_isStandBy() {
        sut.productView.productId = ""
        guard let mockProductView = sut.productView as? MockProductView else {
                return XCTFail()
        }
        XCTAssertTrue(sut.currentState is ProductStandByState)
        XCTAssertFalse(mockProductView.didStartLoading)
        XCTAssertFalse(mockProductView.didFinishLoading)
    }
    
    func test_processingState_whenGivenProductId_setProductData() {
        let gettingProduct = expectation(description: "Getting product expectation")
        guard let mockProductView = sut.productView as? MockProductView else {
                return XCTFail()
        }
        
        mockProductView.expectation = gettingProduct
        sut.productView.productId = "productId"
        sut.loadProductById()
        
        wait(for: [gettingProduct], timeout: 2)
        XCTAssertTrue(sut.currentState is ProductStandByState)
        XCTAssertFalse(mockProductView.isEmptyViewShown)
        XCTAssertNotNil(mockProductView.product)
    }
    
    func test_withErrorResponse_resultsInErrorView() {
        let gettingErrorExpectation = expectation(description: "Getting result error expectation")
        guard let mockProductView = sut.productView as? MockProductView else {
            return XCTFail()
        }
        
        mockProductView.expectation = gettingErrorExpectation
        sut.productView.productId = "productId"
        itemService.isErrorResponse = true
        sut.loadProductById()
        
        wait(for: [gettingErrorExpectation], timeout: 10)
        XCTAssertTrue(sut.currentState is ProductStandByState)
        XCTAssertTrue(mockProductView.didStartLoading)
        XCTAssertTrue(mockProductView.didFinishLoading)
        XCTAssertTrue(mockProductView.isErrorViewShown)
        XCTAssertFalse(mockProductView.isEmptyViewShown)
    }
}
    
extension ProductViewModelTests {
    class MockProductView: ProductView {
        var productId: String = ""
        var product: Product?
        var didStartLoading: Bool = false
        var didFinishLoading: Bool = false
        var isEmptyViewShown: Bool = false
        var isErrorViewShown: Bool = false
        var expectation: XCTestExpectation?
        
        func startLoading() {
            didStartLoading = true
            print("\(#function) called")
        }
        
        func finishLoading() {
            didFinishLoading = true
            print("\(#function) called")
            self.expectation?.fulfill()
        }
        
        func setData(with product: Product) {
            self.product = product
            print("\(#function) called with product: \(product.title)")
        }
        
        func setEmptyView() {
            isEmptyViewShown = true
            print("\(#function) called")
        }
        
        func setErrorView() {
            isErrorViewShown = true
            print("\(#function) called")
        }
        
        init(productId: String) {
            self.productId = productId
        }
    }
}
