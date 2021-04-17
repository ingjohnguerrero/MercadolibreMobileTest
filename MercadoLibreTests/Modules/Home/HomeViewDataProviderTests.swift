//
//  HomeViewDataProviderTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 12/04/21.
//

import XCTest
@testable import MercadoLibre

class HomeViewDataProviderTests: XCTestCase {
    
    var sut: HomeViewController!
    var viewModel: HomeViewModel!
    var tableView: UITableView!
    var itemService: ItemsService!
    var item: Product?
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else {
            return
        }
        
        let homeViewController = viewController
        
        sut = homeViewController
        itemService = MockItemsService()
        viewModel = HomeViewModel(view: sut, service: itemService)
        
        sut.viewModel = viewModel
        
        sut.loadViewIfNeeded()
        
        tableView = sut.tableView
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_NumberOfSections_IsOne() {
        viewModel.searchTerm = "something"
        viewModel.startSearching()
        
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func test_CellForRow_ReturnsItemCell() {
        viewModel.homeView.searchTerm = "something"
        viewModel.startSearching()
        
        let cell =
            tableView.cellForRow(at: IndexPath(row: 0,
                                               section: 0))
        
        XCTAssertTrue(cell is HomeTableViewCell)
    }
    
    func test_CellForRow_DequeuesCellFromTableView() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)

        viewModel.homeView.searchTerm = "something"
        viewModel.startSearching()
        
        mockTableView.reloadData()

        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
}

extension HomeViewDataProviderTests {
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        class func mockTableView(
            withDataSource dataSource: UITableViewDataSource)
        -> MockTableView {
            
            let mockTableView = MockTableView(
                frame: CGRect(x: 0, y: 0, width: 320, height: 480),
                style: .plain)
            
            mockTableView.dataSource = dataSource
            HomeTableViewCell.registerCellPrototypes(tableView: mockTableView)
            
            return mockTableView
        }
        
        override func dequeueReusableCell(
            withIdentifier identifier: String,
            for indexPath: IndexPath) -> UITableViewCell {
            
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier,
                                             for: indexPath)
        }
    }

}
