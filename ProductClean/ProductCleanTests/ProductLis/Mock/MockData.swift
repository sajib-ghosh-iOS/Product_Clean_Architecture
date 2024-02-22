//
//  MockData.swift
//  ProductCleanTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

import Foundation
@testable import ProductClean

class MockData {

    static var productList: [Product] {
        return domainProducts.map { $0.toPresentation() }
    }
    
    static var domainProducts: [ProductDomainListDTO] {
        return productPage.products.map { $0.toDomain() }
    }
    
    static var productPage: ProductPageDataListDTO {
        try! JSONDecoder().decode(ProductPageDataListDTO.self, from: productsRawData)
    }
    
    static var productsRawData: Data {
        loadJsonData("Products")
    }
    
    private static func loadJsonData(_ fromFile: String) -> Data {
        let path = Bundle(for: self).path(forResource: fromFile, ofType: "json")
        let jsonString = try! String(contentsOfFile: path!, encoding: .utf8)
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
