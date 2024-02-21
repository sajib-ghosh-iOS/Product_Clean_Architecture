//
//  ProductListViewModel.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

protocol ProductListViewModel: ObservableObject {
    func fetchProducts() async
    var products: [ProductListItemViewModel] {get set}
    var isEmpty: Bool {get}
    var isError: Bool {get}
    var error: String {get}
}

final class DefaultProductListViewModel: ProductListViewModel {
    @Published var products: [ProductListItemViewModel] = []
    var isEmpty: Bool { return products.isEmpty }
    @Published var isError: Bool = false
    @Published var error: String = ""
    private let productListUseCase: ProductListUseCase?
    init(useCase: ProductListUseCase?) {
        self.productListUseCase = useCase
    }
    func fetchProducts() async {
        do {
            if let productList = try await productListUseCase?.fetchProductList() {
                DispatchQueue.main.async {
                    self.products = self.transformFetchedProducts(products: productList)
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.isError = true
                if let networkError = error as? NetworkError {
                    self.error = networkError.description
                } else {
                    self.error = error.localizedDescription
                }
            }
        }
    }
    func transformFetchedProducts(products: [Product]) -> [ProductListItemViewModel] {
        products.map { ProductListItemViewModel(id: $0.productId,
                                           title: $0.title ?? "",
                                           description: $0.description ?? "",
                                           price: $0.price ?? 0,
                                           image: $0.thumbnail ?? "") }
    }
}
