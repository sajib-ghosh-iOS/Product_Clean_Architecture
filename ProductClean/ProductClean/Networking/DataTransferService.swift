//
//  DataTransferService.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 25/02/24.
//

import Foundation

protocol DataTransferService {
    func request<T: Decodable>(request: NetworkRequest) async throws -> T
}

final class DefaultDataTransferService: DataTransferService {
    
    private let networkManager: NetworkManager
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    /// Method to fetch data from Network Manager and Decode the data using decode method
    /// - Parameter request:  Network request
    /// - Returns: Decodable type object
    func request<T>(request: NetworkRequest) async throws -> T where T : Decodable {
        let data = try await networkManager.fetch(request: request)
        return try decode(data: data)
    }
    
    /// Method to decode data using JSONDecoder
    /// - Parameter data: Data
    /// - Returns: Decodable type object
    func decode<T>(data: Data) throws -> T where T : Decodable {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.unableToDecode
        }
    }
}
