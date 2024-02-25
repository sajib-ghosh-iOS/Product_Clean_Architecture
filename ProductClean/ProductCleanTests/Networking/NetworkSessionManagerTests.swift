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
        let config = ApiDataNetworkConfig(baseURL: "dummyjson.com")
        let request = DefaultNetworkRequest(path: "/products")
        let (data,response) = try await networkSessionManger.request(with: config, request: request)
        XCTAssertNotNil(data)
        XCTAssertNotNil(response)
    }
    
    
    func testBadURLFailure() async throws {
        let config = ApiDataNetworkConfig(baseURL: "Bad URL")
        let request = DefaultNetworkRequest(path: "invalid")
        do {
            let _ = try await networkSessionManger.request(with: config, request: request)
            XCTFail("Should not succeed")
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.invalidRequest)
        }
    }
}
