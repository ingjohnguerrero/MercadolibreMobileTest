//
//  APIEnvironmentsTests.swift
//  MercadoLibreTests
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import XCTest
@testable import MercadoLibre

class APIEnvironmentsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getting_baseUrl_returnNotEmptyString() {
        XCTAssertFalse(APIEnvironments.production.baseUrl.isEmpty)
    }

}
