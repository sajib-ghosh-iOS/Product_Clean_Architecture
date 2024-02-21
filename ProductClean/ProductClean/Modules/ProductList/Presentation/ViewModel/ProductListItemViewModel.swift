//
//  ProductItemViewModel.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

struct ProductListItemViewModel: Hashable {
    var id: Int
    var title: String
    var description: String
    var price: Int
    var image: String
}

extension ProductListItemViewModel {
    func toProductDetails() -> ProductDetailsItemViewModel {
        .init(id: id, title: title, description: description, price: price, image: image)
    }
}
