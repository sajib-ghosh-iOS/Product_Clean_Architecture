//
//  ProductDetailsView.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 21/02/24.
//

import SwiftUI

struct ProductDetailsView: View {
    let viewModel: ProductDetailsViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HeaderImageView(urlString: viewModel.productDetailsItem.image, height: 300)
                Text("Title : \(viewModel.productDetailsItem.title)")
                    .font(.title)
                Text("Price : \(viewModel.productDetailsItem.price, format: .currency(code: "USD"))")
                    .font(.title2)
                Text("Description : \(viewModel.productDetailsItem.description)")
                    .font(.title3)
            }
            .padding(10)
            .navigationTitle("Product Details")
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
        }.preferredColorScheme(.light)
    }
}

#Preview {
    ProductDetailsView(viewModel: DefaultProductDetailsViewModel(productDetailsItem: ProductDetailsItemViewModel(id: 1, title: "Title1", description: "Description1", price: 100, image: "")))
}
