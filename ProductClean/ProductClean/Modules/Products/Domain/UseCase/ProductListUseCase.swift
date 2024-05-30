//
//  ProductListUseCase.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

protocol ProductListUseCase {
    func fetchProductList() async throws -> [ProductDomainListDTO]
}

final class DefaultProductListUseCase: ProductListUseCase {
    
    private let repository: ProductListRepository
    
    init(repository: ProductListRepository) {
        self.repository = repository
    }
    
    func fetchProductList() async throws -> [ProductDomainListDTO] {
        try await repository.fetchProductList()
    }
}
