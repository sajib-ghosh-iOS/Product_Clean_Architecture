//
//  MockURLSession.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import Foundation
@testable import ProductClean

class MockNetworkSessionManager: NetworkSessionManager {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func request(with config: NetworkConfigurable, request: NetworkRequest) async throws -> (Data?, URLResponse?) {
        if let error = self.error {
            throw error
        }
        return (data, response)
    }
}
