//
//  URLRequestCreaterTests.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
@testable import ProductClean

final class URLRequestCreaterTests: XCTestCase {

    var requestGenerator: URLRequestGenerator!
    
    override func setUp() {
        super.setUp()
        requestGenerator = DefaultURLRequestGenerator()
    }
    
    override func tearDown() {
        requestGenerator = nil
        super.tearDown()
    }
    
    func testURLRequest() {
        do {
            let urlRequest = try requestGenerator.generateURLRequest(with: MockApiDataNetworkConfig(), from: MockNetworkRequest())
            XCTAssertEqual(urlRequest.url?.host, "dummyjson.com")
            XCTAssertEqual(urlRequest.url?.scheme, "https")
            XCTAssertEqual(urlRequest.url?.path, "/products")
            XCTAssertEqual(urlRequest.url, URL(string: "https://dummyjson.com/products?"))
            XCTAssertEqual(urlRequest.httpMethod, HTTPMethod.get.rawValue)
            XCTAssertEqual(urlRequest.allHTTPHeaderFields, ["Content-Type":"application/json"])
            XCTAssertNil(urlRequest.httpBody)
        } catch {
            XCTFail("Request Failed unexpectedly")
        }
    }
}
