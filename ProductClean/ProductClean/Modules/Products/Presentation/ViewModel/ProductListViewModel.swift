//
//  ProductListViewModel.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

protocol ProductListViewModelOutput: ObservableObject {
    var products: [ProductListItemViewModel] {get set}
    var isError: Bool {get}
    var error: String {get}
    var isEmpty: Bool {get}
    func shouldShowLoader() -> Bool
}

protocol ProductListViewModelInput {
    func fetchProducts() async
}

typealias ProductListViewModel = ProductListViewModelInput & ProductListViewModelOutput

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
    /// - Parameter products:Product
    /// - Returns: array of ProductListItemViewModel
    private func transformFetchedProducts(products: [Product]) -> [ProductListItemViewModel] {
        products.map { ProductListItemViewModel(id: $0.productId,
                                           title: $0.title ?? "",
                                           description: $0.description ?? "",
                                                price: $0.price?.currency ?? "",
                                           image: $0.thumbnail ?? "") }
    }
    
    /// This method check if the loader should be shown or not
    /// - Returns: True if there the product array is empty and error is not there
    func shouldShowLoader() -> Bool {
        return (isEmpty && !isError)
    }
}

extension Double {
    
    /// It converts a double amount to a string with currency
    /// For example double value -> 100, return value -> "$100"
    var currency: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.locale = Locale(identifier: AppConstant.currencyIndentifier)
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
