//
//  NetworkManager.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

protocol NetworkSessionManager {
    func request(with config: NetworkConfigurable, request: NetworkRequest) async throws -> (Data?, URLResponse?)
}
protocol NetworkManager {
    func fetch(request: NetworkRequest) async throws -> Data
}

final class DefaultNetworkManager: NetworkManager {
    private let config: NetworkConfigurable
    private let sessionManager: NetworkSessionManager
    init(config: NetworkConfigurable,
        sessionManager: NetworkSessionManager = DefaultNetworkSessionManager()) {
        self.config = config
        self.sessionManager = sessionManager
    }
    
    /// Method to fetch data from Session Manager and validates the data and response
    /// - Parameter request: Network Request
    /// - Returns: Data
    func fetch(request: NetworkRequest) async throws -> Data {
        let (data, response) = try await sessionManager.request(with: config, request: request)
        guard let response = response as? HTTPURLResponse else { throw NetworkError.noResponse }
        if response.statusCode != 200 { throw NetworkError.failed }
        guard let data = data else { throw NetworkError.noData }
        return data
    }
}
