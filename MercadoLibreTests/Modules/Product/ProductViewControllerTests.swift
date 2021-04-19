//
//  ProductViewControllerTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 12/04/21.
//

import XCTest
@testable import MercadoLibre

class ProductViewControllerTests: XCTestCase {
    
    var sut: ProductViewController!
    
    override func setUp() {
        super.setUp()
        
        let navigationController = UINavigationController()
        let coordinator = MainCoordinator(navigationController: navigationController)
        
        let productViewController = ProductViewController.instantiate(storyboard: .product)
        productViewController.viewModel = ProductViewModel(view: productViewController)
        productViewController.coordinator = coordinator
        
        sut = productViewController
        
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
    
    func test_viewModel_afterViewDidLoad_isNotNil() {
        XCTAssertNotNil(sut.viewModel)
    }
    
    func coordinator_afterViewDidLoad_isNotNil() {
        XCTAssertNotNil(sut.coordinator)
    }
    
    func test_HasTitleLabel() {
        let titleLabelIsSubView = sut.titleLabel?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(titleLabelIsSubView)
    }
    
    func test_hasMainImageView() {
        let descriptionLabelIsSubView = sut.mainImageView?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(descriptionLabelIsSubView)
    }
    
    func test_hasPriceLabel() {
        let descriptionLabelIsSubView = sut.priceLabel?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(descriptionLabelIsSubView)
    }
    
    func test_hasDescriptionLabel() {
        let descriptionLabelIsSubView = sut.descriptionLabel?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(descriptionLabelIsSubView)
    }
    
    func test_titleLabel_afterViewDidLoad_isNotEmpty() {
        XCTAssertFalse(sut.titleLabel.text?.isEmpty ?? true)
    }

}
