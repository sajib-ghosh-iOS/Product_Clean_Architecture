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
    var mockDataTransferService: MockDataTransferService!

    override func setUp() {
        super.setUp()
        mockDataTransferService = MockDataTransferService()
        productService = DefaultProductListService(apiDataService: mockDataTransferService)
    }
    
    override func tearDown() {
        productService = nil
        mockDataTransferService = nil
        super.tearDown()
    }
    
    func testProductServiceSuccess() async throws {
        mockDataTransferService.response = MockData.productPage
        let productPage = try await productService.fetchProductListFromNetwork()
        XCTAssertEqual(productPage.products.count, 5)
    }

    func testProductServiceFailure() async throws {
        mockDataTransferService.error = NSError(domain: "FailedError", code: 0)
        do {
            _ = try await productService.fetchProductListFromNetwork()
            XCTFail("Success not expected")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
