//
//  ProductListModule.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 21/02/24.
//

import Foundation
class ProductsModule {
    private let apiDataTransferService: DataTransferService
    
    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
    
    func generateProductListView() -> ProductListView<DefaultProductListViewModel> {
        ProductListView(viewModel: generateProductListViewModel())
    }
    
    private func generateProductListViewModel() -> DefaultProductListViewModel {
        DefaultProductListViewModel(useCase: generateProductListUseCase())
    }
    
    private func generateProductListUseCase() -> ProductListUseCase {
        DefaultProductListUseCase(repository: generateProductListRepository())
    }
    
    private func generateProductListRepository() -> ProductListRepository {
        DefaultProductListRepository(service: generateProductListService())
    }
    
    private func generateProductListService() -> ProductListService {
        DefaultProductListService(apiDataService: apiDataTransferService)
    }
}
