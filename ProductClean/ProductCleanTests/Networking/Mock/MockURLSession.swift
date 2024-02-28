//
//  MockURLSession.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 27/02/24.
//

import Foundation
@testable import ProductClean

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?) {
        if let error {
            throw error
        }
        return (data, urlResponse)
    }
}


