//
//  ProductListViewModelMock.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

@testable import ProductClean

class ProductListViewModelMock: ProductListViewModel {
    
    var products: [ProductListItemViewModel] = []
    var isEmpty: Bool { return products.isEmpty }
    var isError: Bool = false
    var error: String = "Error"
    
    func fetchProducts() async {
        
    }
}