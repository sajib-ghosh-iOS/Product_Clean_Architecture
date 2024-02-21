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

class DefaultNetworkManager: NetworkManager {
    private let session: URLSession
    private let requestGenerator: URLRequestGenerator
    init(session: URLSession = SharedURLSession.shared,
         requestGenerator: URLRequestGenerator = DefaultURLRequestGenerator()) {
        self.session = session
        self.requestGenerator = requestGenerator
    }
    func fetch<T>(request: NetworkRequest) async throws -> T where T: Decodable {
        let urlRequest = try requestGenerator.generateURLRequest(from: request)
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.noResponse }
            if response.statusCode != 200 { throw NetworkError.failed }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
            } catch {
                throw NetworkError.unableToDecode
            }
        } catch {
            throw NetworkError.badRequest
        }
    }
}
