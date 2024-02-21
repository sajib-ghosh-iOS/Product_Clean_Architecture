//
//  NetworkSessionManager.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 21/02/24.
//

import Foundation

protocol NetworkSessionManager {
    func data(_ request: URLRequest) async throws -> (Data?, URLResponse?)
}

class DefaultNetworkSessionManager: NetworkSessionManager {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
    func data(_ request: URLRequest) async throws -> (Data?, URLResponse?) {
        do {
            return try await session.data(for: request)
        } catch {
            throw NetworkError.badRequest
        }
    }
}
