//
//  ProductDetailsViewModel.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 21/02/24.
//

import Foundation

protocol ProductDetailsViewModel {
    var productDetailsItem: ProductDetailsItemViewModel {get set}
}

class DefaultProductDetailsViewModel: ProductDetailsViewModel {
    var productDetailsItem: ProductDetailsItemViewModel
    init(productDetailsItem: ProductDetailsItemViewModel) {
        self.productDetailsItem = productDetailsItem
    }
}
