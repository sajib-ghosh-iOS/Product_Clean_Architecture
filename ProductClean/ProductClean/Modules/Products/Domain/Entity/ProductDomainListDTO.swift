//
//  ProductDomainListDTO.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

struct ProductDomainListDTO {
    let productId: Int
    let title: String?
    let description: String?
    let price: Int?
    let thumbnail: String?
}

extension ProductDomainListDTO {
    func toPresentation() -> Product {
        .init(productId: productId,
              title: title,
              description: description,
              price: Double(price ?? 0),
              thumbnail: thumbnail)
    }
}
