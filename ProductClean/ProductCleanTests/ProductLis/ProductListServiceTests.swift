//
//  ProductListServiceTests.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//
import XCTest
@testable import ProductClean

class PostServiceTests: XCTestCase {

    var productService: ProductListService!
    var mockNetworkManager: MockNetworkManager!

    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        productService = DefaultProductListService(netoworkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        productService = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testProductServiceSuccess() async throws {
        mockNetworkManager.response = MockData.productPage
        let data = try await productService.fetchProductListFromNetwork()
        XCTAssertNotNil(data)
    }

    func testProductServiceFailure() async throws {
        mockNetworkManager.error = NSError(domain: "FailedError", code: 0)
        do {
            _ = try await productService.fetchProductListFromNetwork()
            XCTFail("Success not expected")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
