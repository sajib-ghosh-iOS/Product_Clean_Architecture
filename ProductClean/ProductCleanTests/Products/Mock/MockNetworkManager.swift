//
//  MockNetworkManager.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

@testable import ProductClean

class MockNetworkManager: NetworkManager {
    var response: Decodable?
    var error: Error?
    func fetch<T>(request: ProductClean.NetworkRequest) async throws -> T where T: Decodable {
        if let error {
            throw error
        }
        return response as! T
    }
}
