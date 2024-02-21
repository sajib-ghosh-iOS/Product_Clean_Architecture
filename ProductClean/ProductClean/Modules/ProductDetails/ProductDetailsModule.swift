//
//  ProductDetailsModule.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 21/02/24.
//

import Foundation

class ProductDetailsModule {
    func generateProductDetailsView(with item: ProductDetailsItemViewModel) -> ProductDetailsView {
        ProductDetailsView(viewModel: generateProductDetailsViewModel(with: item))
    }
    func generateProductDetailsViewModel(with item: ProductDetailsItemViewModel) -> ProductDetailsViewModel {
        DefaultProductDetailsViewModel(productDetailsItem: item)
    }
}
