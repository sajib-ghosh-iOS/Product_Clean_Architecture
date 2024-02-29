//
//  ProductListModule.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 21/02/24.
//

import Foundation

final class ProductsModule {

    private let apiDataTransferService: DataTransferService
    
    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
    
    func generateProductListView() -> ProductListView<ProductListViewModel> {
        ProductListView(viewModel: generateProductListViewModel())
    }
    
    private func generateProductListViewModel() -> ProductListViewModel {
        ProductListViewModel(useCase: generateProductListUseCase())
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
