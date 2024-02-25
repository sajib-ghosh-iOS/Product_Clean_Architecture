//
//  DataTransferTests.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 25/02/24.
//

import XCTest
@testable import ProductClean

final class DataTransferTests: XCTestCase {

    var dataTransferService: DataTransferService!
    var networkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        dataTransferService = DefaultDataTransferService(networkManager: networkManager)
    }

    override func tearDown() {
        super.tearDown()
        networkManager = nil
        dataTransferService = nil
    }
    
    func testRequestSuccessResponse() async throws {
        networkManager.data = MockData.productsRawData
        let request = DefaultNetworkRequest(path: "/products")
        let productPage = try await getProductData(request: request)
        XCTAssertEqual(productPage.products.count, 5)
    }
    
    func getProductData(request: NetworkRequest) async throws -> ProductPageDataListDTO {
        try await dataTransferService.request(request: request)
    }
    
    func testRequestFailureCase() async throws {
        networkManager.error = NSError(domain: "Failed", code: 0)
        let request = DefaultNetworkRequest(path: "/products")
        do {
           _ = try await getProductData(request: request)
            XCTFail("Should not succeed")
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func testDecodingFailureCase() async throws {
        networkManager.data = Data()
        let request = DefaultNetworkRequest(path: "/products")
        do {
           _ = try await getProductData(request: request)
            XCTFail("Should not succeed")
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.unableToDecode)
        }
    }
}

