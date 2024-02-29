//
//  MockProductListService.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

@testable import ProductClean

final class MockProductListService: ProductListService {
    
    var response: ProductPageDataListDTO?
    var error: Error?
    
    func fetchProductListFromNetwork() async throws -> ProductPageDataListDTO {
        if let error {
            throw error
        }
        return response!
    }
}
