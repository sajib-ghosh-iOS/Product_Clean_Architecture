//
//  AppDIContainer.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

final class AppDIContainer {
    private var networkManager: NetworkManager = {
        let networkManager = DefaultNetworkManager(sessionManager: DefaultNetworkSessionManager(session: SharedURLSession.shared))
        return networkManager
    }()
    
    lazy var productListView: ProductListView = {
        let productsModule = ProductsModule(networkManager: networkManager)
        return productsModule.generateProductListView()
    }()
}
