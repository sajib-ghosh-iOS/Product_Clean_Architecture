//
//  ProductListView.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI

struct ProductListView<ViewModel>: View where ViewModel: ProductListViewModelProtocol {
    
    @ObservedObject private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            if viewModel.shouldShowLoader() {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                ProductListLayout(items: viewModel.products)
                    .overlay {
                        if viewModel.isError {
                            ErrorView(errorTitle: AppConstant.errorTitle, errorDescription: viewModel.error) {
                                Task {
                                    await fetchProducts()
                                }
                            }
                        }
                    }
                    .navigationTitle(viewModel.title)
            }
        }
        .task {
            await fetchProducts()
        }
    }
    
    private func fetchProducts() async {
        await viewModel.fetchProducts()
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(viewModel: ProductListView_Previews.getViewModel())
    }
}
