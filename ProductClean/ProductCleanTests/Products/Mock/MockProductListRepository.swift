//
//  MockProductListRepository.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

@testable import ProductClean

class MockProductListRepository: ProductListRepository {
    var response: [ProductDomainListDTO]?
    var error: Error?
    func fetchProductList() async throws -> [ProductDomainListDTO] {
        if let error {
            throw error
        }
        return response!
    }
}
