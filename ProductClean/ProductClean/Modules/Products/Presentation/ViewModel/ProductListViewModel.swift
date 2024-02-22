//
//  ProductListViewModel.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

protocol ProductListViewModel: ObservableObject {
    var products: [ProductListItemViewModel] {get set}
    var isError: Bool {get}
    var error: String {get}
    var isEmpty: Bool {get}
    func fetchProducts() async
}


final class DefaultProductListViewModel: ProductListViewModel {
    @Published var products: [ProductListItemViewModel] = []
    @Published var isError: Bool = false
    @Published var error: String = ""
    var isEmpty: Bool { return products.isEmpty }
    
    private let productListUseCase: ProductListUseCase!
    init(useCase: ProductListUseCase) {
        self.productListUseCase = useCase
    }
    /// This method fetches products and catches error if any
    @MainActor func fetchProducts() async {
        do {
            let productList = try await productListUseCase.fetchProductList()
            self.products = self.transformFetchedProducts(products: productList)
        } catch {
            self.isError = true
            if let networkError = error as? NetworkError {
                self.error = networkError.description
            } else {
                self.error = error.localizedDescription
            }
        }
    }
    /// This method maps Product to ProductListItemViewModel
    /// - Returns : array of ProductListItemViewModel
    private func transformFetchedProducts(products: [Product]) -> [ProductListItemViewModel] {
        products.map { ProductListItemViewModel(id: $0.productId,
                                           title: $0.title ?? "",
                                           description: $0.description ?? "",
                                           price: $0.price ?? 0,
                                           image: $0.thumbnail ?? "") }
    }
}
