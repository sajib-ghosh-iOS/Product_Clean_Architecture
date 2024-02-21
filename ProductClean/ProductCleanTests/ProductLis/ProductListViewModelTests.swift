//
//  ProductListViewModelTests.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

import XCTest
@testable import ProductClean

class ProductListViewModelTest: XCTestCase {
    
    var productListViewModel: DefaultProductListViewModel!
    var mockProductUseCase: MockProductListUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        mockProductUseCase = MockProductListUseCase()
        productListViewModel = DefaultProductListViewModel(useCase: mockProductUseCase)
    }
    
    override func tearDown() {
        super.tearDown()
        productListViewModel = nil
        mockProductUseCase = nil
    }

    func testProductListViewModelSuccess() async throws {
        mockProductUseCase.response = MockData.productList
        await productListViewModel.fetchProducts()
        let expectation = XCTestExpectation(description: "")
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(productListViewModel.products.count == 5)
        XCTAssertEqual(result, .timedOut)
    }
    
    func testProductListViewModelFailure() async throws {
        mockProductUseCase.error = NetworkError.failed
        XCTAssertTrue(productListViewModel.products.count == 0)
        XCTAssertNotNil(productListViewModel.error)
    }
}
