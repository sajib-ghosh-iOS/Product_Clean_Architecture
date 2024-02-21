//
//  URLRequestGenerator.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

protocol URLRequestGenerator {
    func generateURLRequest(from request: NetworkRequest) throws -> URLRequest
}

class DefaultURLRequestGenerator: URLRequestGenerator {
    func generateURLRequest(from request: NetworkRequest) throws -> URLRequest {
        let url = try createURL(with: request)
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        if !request.bodyParameters.isEmpty {
            let bodyData = try? JSONSerialization.data(withJSONObject: request.bodyParameters,
                                                       options: [.prettyPrinted])
            urlRequest.httpBody = bodyData
        }
        request.headerParameters.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        return urlRequest
    }
    private func createURL(with request: NetworkRequest) throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = AppConfiguration.baseURL
        components.path = request.path
        components.queryItems = request.queryParameters.map { URLQueryItem(name: $0, value: "\($1)") }
        guard let url = components.url else { throw NetworkError.badURL }
        return url
    }
}
