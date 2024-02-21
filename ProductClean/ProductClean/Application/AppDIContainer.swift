//
//  AppDIContainer.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

final class AppDIContainer {
    lazy var productListView: ProductListView = {
        let productListModule = ProductListModule(networkManager: DefaultNetworkManager())
        return productListModule.generateProductListView()
    }()
}
