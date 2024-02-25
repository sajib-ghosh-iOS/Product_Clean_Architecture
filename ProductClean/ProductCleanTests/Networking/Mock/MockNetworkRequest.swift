//
//  MockNetworkRequest.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import Foundation
@testable import ProductClean

class MockNetworkRequest: NetworkRequest {
    var path = "/products"
    var method = HTTPMethod.get
    var headerParameters: [String : String] = ["Content-Type":"application/json"]
    var queryParameters: [String : Any] = [:]
    var bodyParameters: [String : Any] = [:]
}

class MockApiDataNetworkConfig: NetworkConfigurable {
    var baseURL: String = "dummyjson.com"
    var headers: [String : String] = ["Content-Type":"application/json"]
}
