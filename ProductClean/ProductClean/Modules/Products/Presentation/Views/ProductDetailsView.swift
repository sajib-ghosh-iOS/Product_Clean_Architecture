//
//  ProductDetailsView.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 21/02/24.
//

import SwiftUI

struct ProductDetailsView: View {
    let item: ProductListItemViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HeaderImageView(urlString: item.image, height: 300)
                Text(item.title)
                    .font(.title)
                Text(item.price, format: .currency(code: AppConfiguration.currencyCode))
                    .font(.title2)
                Text(item.description)
                    .font(.title3)
            }
            .padding(10)
            .navigationTitle(AppConstant.productDetailsTitle)
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
        }.preferredColorScheme(.light)
    }
}
