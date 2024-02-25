//
//  NetworkManagerTests.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

import XCTest
@testable import ProductClean

final class NetworkManagerTests: XCTestCase {

    var networkManger: NetworkManager!
    var sessionManager: MockNetworkSessionManager!
    
    var response = HTTPURLResponse(url: URL(string: "/products")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    var invalidResponse = HTTPURLResponse(url: URL(string: "/zzzz")!, statusCode: 400, httpVersion: nil, headerFields: nil)
    override func setUp() {
        super.setUp()
        sessionManager = MockNetworkSessionManager()
        networkManger = DefaultNetworkManager(config: MockApiDataNetworkConfig(), sessionManager: sessionManager)
    }

    override func tearDown() {
        super.tearDown()
        networkManger = nil
        sessionManager = nil
    }
    
    func testRequestSuccessResponse() async throws {
        sessionManager.data = MockData.productsRawData
        sessionManager.response = response
        let request = DefaultNetworkRequest(path: "/products")
        let data = try await getProductData(request: request)
        XCTAssertNotNil(data)
    }
    
    func getProductData(request: NetworkRequest) async throws -> Data {
        try await networkManger.fetch(request: request)
    }
    
    func testRequestFailureCase() async throws {
        sessionManager.error = NSError(domain: "Failed", code: 0)
        let request = DefaultNetworkRequest(path: "/products")
        do {
           _ = try await getProductData(request: request)
            XCTFail("Should not succeed")
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func testRequestFailedResponseCase() async throws {
        sessionManager.data = MockData.productsRawData
        sessionManager.response = invalidResponse
        let request = DefaultNetworkRequest(path: "/products")
        do {
           _ = try await getProductData(request: request)
            XCTFail("Should not succeed")
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.failed)
        }
    }
    
    func testEmptyResponseFailureCase() async throws {
        sessionManager.data = MockData.productsRawData
        let request = DefaultNetworkRequest(path: "/products")
        do {
           _ = try await getProductData(request: request)
            XCTFail("Should not succeed")
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.noResponse)
        }
    }
}
