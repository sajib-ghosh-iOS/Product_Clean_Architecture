//
//  ProductListModule.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 21/02/24.
//

import Foundation
class ProductListModule {
    private let networkManager: NetworkManager
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    func generateProductListView() -> ProductListView<DefaultProductListViewModel> {
        ProductListView(viewModel: generateProductListViewModel())
    }
    func generateProductListViewModel() -> DefaultProductListViewModel {
        DefaultProductListViewModel(useCase: generateProductListUseCase())
    }
    func generateProductListUseCase() -> ProductListUseCase {
        DefaultProductListUseCase(repository: generateProductListRepository())
    }
    func generateProductListRepository() -> ProductListRepository {
        DefaultProductListRepository(service: generateProductListService())
    }
    func generateProductListService() -> ProductListService {
        DefaultProductListService(netoworkManager: networkManager)
    }
}
