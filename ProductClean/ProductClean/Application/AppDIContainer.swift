//
//  AppDIContainer.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import Foundation

final class AppDIContainer {
    lazy private var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: AppConfiguration.baseURL)
        let sessionManager = DefaultNetworkSessionManager(session: SharedURLSession.shared)
        let networkManager = DefaultNetworkManager(config: config, sessionManager: sessionManager)
        return DefaultDataTransferService(networkManager: networkManager)
    }()
    
    lazy var productListView: ProductListView = {
        let productsModule = ProductsModule(apiDataTransferService: apiDataTransferService)
        return productsModule.generateProductListView()
    }()
}
