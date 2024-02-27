//
//  URLSession+AsyncData.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 27/02/24.
//

import Foundation
extension URLSession {
    @objc func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?) {
        return try await self.data(for: request)
     }
}
