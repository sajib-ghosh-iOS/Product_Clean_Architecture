//
//  ProductListRepositoryProtocol.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 22/02/24.
//

import Foundation

protocol ProductListRepository {
    func fetchProductList() async throws -> [ProductDomainListDTO]
}
