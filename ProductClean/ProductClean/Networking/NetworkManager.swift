//
//  NetworkManager.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

protocol NetworkManager {
    func fetch<T: Decodable>(request: NetworkRequest) async throws -> T
}

final class DefaultNetworkManager: NetworkManager {
    private let sessionManager: NetworkSessionManager
    private let requestGenerator: URLRequestGenerator
    init(sessionManager: NetworkSessionManager = DefaultNetworkSessionManager(),
         requestGenerator: URLRequestGenerator = DefaultURLRequestGenerator()) {
        self.sessionManager = sessionManager
        self.requestGenerator = requestGenerator
    }
    func fetch<T>(request: NetworkRequest) async throws -> T where T: Decodable {
        do {
            let urlRequest = try requestGenerator.generateURLRequest(from: request)
            let (data, response) = try await sessionManager.data(urlRequest)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.noResponse }
            if response.statusCode != 200 { throw NetworkError.failed }
            guard let data = data else { throw NetworkError.noData }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
            } catch {
                throw NetworkError.unableToDecode
            }
        } catch {
            throw error
        }
    }
}
