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
        sut = HomeViewModel(view: homeView)
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

}

extension HomeViewModelTests {
    class MockHomeView: HomeView {
        func startLoading() {
            print("Start loading")
        }
        
        func finishLoading() {
            print("Finish loading")
        }
        
        func setResults(with products: [Product]) {
            print("Set products: \(products.count)")
        }
        
        func setEmptyView() {
            print("Set empty view")
        }
        
        func setErrorView() {
            print("Set Error view")
        }
    }
}
