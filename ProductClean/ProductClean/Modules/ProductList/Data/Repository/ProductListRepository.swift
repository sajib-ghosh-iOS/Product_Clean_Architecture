//
//  ProductListRepository.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation
protocol ProductListRepository {
    func fetchProductList() async throws -> [ProductDomainListDTO]
}

final class DefaultProductListRepository: ProductListRepository {
    private let service: ProductListService
    init(service: ProductListService) {
        self.service = service
    }
    func fetchProductList() async throws -> [ProductDomainListDTO] {
        try await service.fetchProductListFromNetwork().products.map { $0.toDomain() }
    }
}
