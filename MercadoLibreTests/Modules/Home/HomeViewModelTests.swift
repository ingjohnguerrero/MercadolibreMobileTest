//
//  HomeViewModelTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import XCTest
@testable import MercadoLibre

class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    let homeView = MockHomeView()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HomeViewModel(view: homeView, service: MockItemsService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_resultsNotNil() {
        XCTAssertNotNil(sut)
    }
    
    func test_whenGivenView_setInstanceView() {
        XCTAssertTrue(sut.homeView is MockHomeView)
    }
    
    func test_initialState_isStandByState() {
        XCTAssertTrue(sut.currentState is HomeStandByState)
    }
    
    func test_currentState_whenGivenTerm_isStandByAfterSearch() {
        sut.searchTerm = "iPhone"
        XCTAssertTrue(sut.currentState is HomeStandByState)
    }
    
    func test_currentState_whenEmptyTerm_isStandBy() {
        sut.searchTerm = ""
        XCTAssertTrue(sut.currentState is HomeStandByState)
    }
    
    func test_processingState_whenGivenTerm_setsResults() {
        let gettingResultsExpectation = expectation(description: "Getting results expectation")
        guard let mockHomeView = sut.homeView as? MockHomeView else {
            return XCTFail()
        }
        
        mockHomeView.expectation = gettingResultsExpectation
        sut.homeView.searchTerm = "iPhone"
        sut.startSearching()
        
        wait(for: [gettingResultsExpectation], timeout: 10)
        XCTAssertTrue(sut.currentState is HomeStandByState)
        XCTAssertFalse(mockHomeView.products.isEmpty)
    }
    
    func test_whenGivenEmptyTerm_resultsInEmptyView() {
        let gettingResultsExpectation = expectation(description: "Getting empty results expectation")
        guard let mockHomeView = sut.homeView as? MockHomeView else {
            return XCTFail()
        }
        
        mockHomeView.expectation = gettingResultsExpectation
        sut.searchTerm = ""
        sut.startSearching()
        
        wait(for: [gettingResultsExpectation], timeout: 10)
        XCTAssertTrue(sut.currentState is HomeStandByState)
        XCTAssertTrue(mockHomeView.products.isEmpty)
        XCTAssertTrue(mockHomeView.isEmptyViewShown)
    }
    
    func test_withErrorResponse_resultsInErrorView() {
        let gettingErrorExpectation = expectation(description: "Getting result error expectation")
        guard let mockHomeView = sut.homeView as? MockHomeView else {
            return XCTFail()
        }
        
        mockHomeView.expectation = gettingErrorExpectation
        (sut.itemService as? MockItemsService)?.isErrorResponse = true
        sut.homeView.searchTerm = "iPhone"
        sut.startSearching()
        
        wait(for: [gettingErrorExpectation], timeout: 10)
        XCTAssertTrue(sut.currentState is HomeStandByState)
        XCTAssertTrue(mockHomeView.isErrorViewShown)
        XCTAssertFalse(mockHomeView.isEmptyViewShown)
    }

}

extension HomeViewModelTests {
    class MockHomeView: HomeView {
        var searchTerm: String = ""
        var products: [Product] = []
        var didStartLoading: Bool = false
        var didFinishLoading: Bool = false
        var isEmptyViewShown: Bool = false
        var isErrorViewShown: Bool = false
        var expectation: XCTestExpectation?
        
        func startLoading() {
            didStartLoading = true
            print("Start loading")
        }
        
        func finishLoading() {
            didFinishLoading = true
            print("Finish loading")
            self.expectation?.fulfill()
        }
        
        func setResults(with products: [Product]) {
            self.products = products
            print("Set products: \(products.count)")
        }
        
        func setEmptyView() {
            isEmptyViewShown = true
            print("Set empty view")
        }
        
        func setErrorView() {
            isErrorViewShown = true
            print("Set Error view")
        }
    }
}
