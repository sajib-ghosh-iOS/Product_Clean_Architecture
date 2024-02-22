//
//  ProductListView.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI

struct ProductListView<ViewModel>: View where ViewModel: ProductListViewModel {
    @ObservedObject private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationStack {
            if viewModel.isEmpty && !viewModel.isError {
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
                    .navigationTitle(AppConstant.productListTitle)
            }
        }
        .task {
            await fetchProducts()
        }
    }
    private func fetchProducts() async {
        if viewModel.isEmpty {
            await viewModel.fetchProducts()
        }
    }
}
