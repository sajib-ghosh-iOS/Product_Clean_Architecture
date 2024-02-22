//
//  ProductListView_Previews.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 22/02/24.
//

import Foundation

extension ProductListView_Previews {
    static func getViewModel() -> ProductListViewModelMock {
        return ProductListViewModelMock()
    }
    
    class ProductListViewModelMock: ProductListViewModel {
        var products: [ProductListItemViewModel] = [.init(id: 1, title: "Title 1", description: "Description 1", price: 100, image: "https://cdn.dummyjson.com/product-images/50/thumbnail.jpg"),
                                                    .init(id: 1, title: "Title 2", description: "Description 2", price: 200, image: "https://cdn.dummyjson.com/product-images/60/thumbnail.jpg")]
        var isEmpty: Bool { return products.isEmpty }
        var isError: Bool = false
        var error: String = "Error"
        func fetchProducts() async {}
    }
}




