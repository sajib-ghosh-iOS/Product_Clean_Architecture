//
//  URLSessionProtocol.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 28/02/24.
//

import Foundation
protocol URLSessionProtocol {
    func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?)
}
extension URLSession: URLSessionProtocol {
    func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?) {
        return try await self.data(for: request)
    }
}
