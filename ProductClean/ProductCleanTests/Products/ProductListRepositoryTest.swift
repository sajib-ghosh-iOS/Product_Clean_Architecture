//
//  ProductListRepositoryTest.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

import XCTest
@testable import ProductClean

final class ProductListRepositoryTest: XCTestCase {
    
    var productRepository: ProductListRepository!
    var mockProductService: MockProductListService!
    
    override func setUp() {
        super.setUp()
        mockProductService = MockProductListService()
        productRepository = DefaultProductListRepository(service: mockProductService)
    }
    
    override func tearDown() {
        super.tearDown()
        productRepository = nil
        mockProductService = nil
    }

    func testProductRepositorySuccess() async throws {
        mockProductService.response = MockData.productPage
        let products = try await productRepository.fetchProductList()
        XCTAssertNotNil(products)
    }
    
    func testProductRepositoryFailure() async throws {
        mockProductService.error = NetworkError.failed
        do {
           _ = try await productRepository.fetchProductList()
            XCTFail("Success not expected")
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.failed)
        }
    }
}
