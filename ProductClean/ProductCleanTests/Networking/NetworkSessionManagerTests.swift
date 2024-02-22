//
//  NetworkSessionManagerTests.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

import XCTest
@testable import ProductClean

final class NetworkSessionManagerTests: XCTestCase {

    var networkSessionManger: NetworkSessionManager!

    override func setUp() {
        super.setUp()
        networkSessionManger = DefaultNetworkSessionManager()
    }

    override func tearDown() {
        super.tearDown()
        networkSessionManger = nil
    }
    
    func testRequestSuccessResponse() async throws {
        let urlRequest = URLRequest(url: URL(string: "https://dummyjson.com/products")!)
        let (data,response) = try await networkSessionManger.data(urlRequest)
        XCTAssertNotNil(data)
        XCTAssertNotNil(response)
    }
    
    func testInvalidRequestFailure() async throws {
        let urlRequest = URLRequest(url: URL(string: "https://dummyjson.com/products/zzzzzz")!)
        do {
            let _ = try await networkSessionManger.data(urlRequest)
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.badRequest)
        }
    }
}
