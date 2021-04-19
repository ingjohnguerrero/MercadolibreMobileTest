//
//  HomeTableViewCellTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 9/04/21.
//

import XCTest
@testable import MercadoLibre

class HomeTableViewCellTests: XCTestCase {
    
    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: HomeTableViewCell!
    let product = Product(id: "id", siteId: "siteId", title: "productTitle", price: 123456, thumbnailUrl: "thumbnail")
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard
            .instantiateViewController(
                withIdentifier: "HomeViewController")
            as! HomeViewController
        
        
        controller.loadViewIfNeeded()
        
        
        tableView = controller.tableView
        tableView?.dataSource = dataSource
        
        HomeTableViewCell.registerCellPrototypes(tableView: tableView)
        
        cell = tableView?.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.cellId,
            for: IndexPath(row: 0, section: 0)) as? HomeTableViewCell
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_HasTitleLabel() {
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
    func hasThumbnailImage() {
        XCTAssertTrue(cell.thumbnailImageView.isDescendant(of: cell.contentView))
    }
    
    func test_ConfigCell_SetsTitle() {
        cell.configure(with: ProductCellViewModel(product: product))
        XCTAssertEqual(cell.titleLabel.text, product.title)
    }
    
}

extension HomeTableViewCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
    }
}
