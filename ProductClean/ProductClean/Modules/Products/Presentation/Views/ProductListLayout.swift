//
//  ProductListLayout.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI

struct ProductListLayout: View {
    
    let items: [ProductListItemViewModel]
    
    var body: some View {
        List {
            ForEach(items, id: \.id) { item in
                NavigationLink(value: item) {
                    ProductItemView(item: item)
                }
            }
        }
        .navigationDestination(for: ProductListItemViewModel.self, destination: { item in
            /// Move to Product Details View
            ProductDetailsView(item: item)
        })
        .preferredColorScheme(.light)
    }
}
