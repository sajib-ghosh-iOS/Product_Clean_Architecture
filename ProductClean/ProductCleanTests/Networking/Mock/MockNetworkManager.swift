//
//  MockNetworkManager.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//
import Foundation
@testable import ProductClean

class MockNetworkManager: NetworkManager {
    var data: Data?
    var error: Error?
    func fetch(request: NetworkRequest) async throws -> Data {
        if let error {
            throw error
        }
        return data!
    }
}
