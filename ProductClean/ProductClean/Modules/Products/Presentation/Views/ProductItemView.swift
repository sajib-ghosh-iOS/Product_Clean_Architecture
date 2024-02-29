//
//  ProductItem.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI

struct ProductItemView: View {
    
    var item: ProductListItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderImageView(urlString: item.image, height: 150)
            Text(item.title).font(.title)
            Text(item.price)
                .foregroundStyle(.red)
                .font(.title2)
        }
        .preferredColorScheme(.light)
    }
}
