//
//  ProductListService.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

protocol ProductListService {
    func fetchProductListFromNetwork() async throws -> ProductPageDataListDTO
}

final class DefaultProductListService: ProductListService {
    private let netoworkManager: NetworkManager
    init(netoworkManager: NetworkManager) {
        self.netoworkManager = netoworkManager
    }
    func fetchProductListFromNetwork() async throws -> ProductPageDataListDTO {
        let networkRequest = DefaultNetworkRequest(path: APIPathConstant.products)
        return try await netoworkManager.fetch(request: networkRequest)
    }
}
