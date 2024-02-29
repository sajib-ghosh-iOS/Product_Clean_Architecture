//
//  ProductListUseCase.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

protocol ProductListUseCase {
    func fetchProductList() async throws -> [Product]
}

final class DefaultProductListUseCase: ProductListUseCase {
    
    private let repository: ProductListRepository
    
    init(repository: ProductListRepository) {
        self.repository = repository
    }
    
    func fetchProductList() async throws -> [Product] {
        try await repository.fetchProductList().map { $0.toPresentation() }
    }
}
