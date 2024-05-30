//
//  ProductListViewModelMock.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

@testable import ProductClean

class ProductListViewModelMock: ProductListViewModelProtocol {
    
    var products: [ProductListItemViewModel] = []
    var isEmpty: Bool { return products.isEmpty }
    var isError: Bool = false
    var error: String = "Error"
    var title: String = "Products"
    func fetchProducts() async {}
    func shouldShowLoader() -> Bool { isEmpty && !isError }
}

class ProductListViewModelMock1: ProductListViewModelOutputProtocol {
    
    var products: [ProductListItemViewModel] = []
    var isEmpty: Bool { return products.isEmpty }
    var isError: Bool = false
    var error: String = "Error"
    var title: String = "Products"
    //func fetchProducts() async {}
    func shouldShowLoader() -> Bool { isEmpty && !isError }
}
