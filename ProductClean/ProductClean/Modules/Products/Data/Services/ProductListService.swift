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
    
    private let apiDataService: DataTransferService
    
    init(apiDataService: DataTransferService) {
        self.apiDataService = apiDataService
    }
    
    func fetchProductListFromNetwork() async throws -> ProductPageDataListDTO {
        let productListNetworkRequest = DefaultNetworkRequest(path: APIEndpoint.products,method: .get)
        return try await apiDataService.request(request: productListNetworkRequest)
    }
}
