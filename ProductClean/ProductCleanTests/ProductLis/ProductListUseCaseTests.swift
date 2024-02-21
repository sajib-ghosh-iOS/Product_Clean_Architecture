//
//  ProductListUseCaseTests.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

import XCTest
@testable import ProductClean

class ProductListUseCaseTest: XCTestCase {
    
    var productUseCase: ProductListUseCase!
    var mockProductRepository: MockProductListRepository!
    
    override func setUp() {
        super.setUp()
        mockProductRepository = MockProductListRepository()
        productUseCase = DefaultProductListUseCase(repository: mockProductRepository)
    }
    
    override func tearDown() {
        super.tearDown()
        productUseCase = nil
        mockProductRepository = nil
    }

    func testProductUseCaseSuccess() async throws {
        mockProductRepository.response = MockData.domainProducts
        let products = try await productUseCase.fetchProductList()
        XCTAssertNotNil(products)
    }
    
    func testProductUseCaseFailure() async throws {
        mockProductRepository.error = NetworkError.failed
        do {
           _ = try await productUseCase.fetchProductList()
            XCTFail("Success not expected")
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.failed)
        }
    }
}

