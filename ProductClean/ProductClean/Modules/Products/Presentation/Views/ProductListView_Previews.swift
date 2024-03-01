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
    
    class ProductListViewModelMock: ProductListViewModelProtocol {
        
        func shouldShowLoader() -> Bool {isEmpty && isError}
        
        var products: [ProductListItemViewModel] = [.init(id: 1, title: "Title 1", description: "Description 1", price: "$100", category: "iPhone", image: "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"),
                                                    .init(id: 2, title: "Title 2", description: "Description 2", price: "$200", category: "iPhone", image: "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg")]
        var isEmpty: Bool { return products.isEmpty }
        var isError: Bool = false
        var error: String = "Error"
        var title: String = "Products"
        func fetchProducts() async {}
    }
}




