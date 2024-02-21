//
//  ProductDataListDTO.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation
struct ProductPageDataListDTO: Decodable {
    let skip: Int
    let limit: Int
    let total: Int
    let products: [ProductDataListDTO]
}
struct ProductDataListDTO: Decodable {
    let productId: Int
    let title: String?
    let description: String?
    let price: Int?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand: String?
    let category: String?
    let thumbnail: String?
    let images: [String]?
    enum CodingKeys: String, CodingKey {
        case productId = "id"
        case title
        case description
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case category
        case thumbnail
        case images
    }
}

extension ProductDataListDTO {
    func toDomain() -> ProductDomainListDTO {
        .init(productId: productId,
              title: title,
              description: description,
              price: price,
              thumbnail: thumbnail)
    }
}
