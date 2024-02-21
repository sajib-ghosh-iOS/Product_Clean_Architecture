//
//  ProductListView.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI

struct ProductListView<Model>: View where Model: ProductListViewModel {
    @ObservedObject private var viewModel: Model
    init(viewModel: Model) {
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
                            ErrorView(errorTitle: "Error", errorDescription: viewModel.error) {
                                Task {
                                    await fetchProducts()
                                }
                            }
                        }
                    }
            }
        }
        .navigationTitle("Products")
        .task {
            await fetchProducts()
        }
    }
    func fetchProducts() async {
        if viewModel.isEmpty {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductListView(viewModel: DefaultProductListViewModel(useCase: nil))
}
