//
//  HomeViewControllerTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import XCTest
@testable import MercadoLibre

class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else {
            return
        }
        
        let homeViewController = viewController
        
        sut = homeViewController
        
        sut.loadViewIfNeeded()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_viewController_isInitialized() {
        XCTAssertNotNil(sut)
    }
    
    func test_tableView_afterViewDidLoad_isNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_searchBar_afterViewDidLoad_isNotNil() {
        XCTAssertNotNil(sut.searchBar)
    }
    
    func test_emptyState_afterViewDidLoad_isNotNil() {
        XCTAssertNotNil(sut.emptyView)
    }
    
    func test_viewModel_afterViewDidLoad_isNotNil() {
        XCTAssertNotNil(sut.viewModel)
    }
}
