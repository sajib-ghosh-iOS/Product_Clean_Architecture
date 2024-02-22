//
//  HeaderImageView.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI
import SDWebImageSwiftUI
struct HeaderImageView: View {
    let urlString: String
    let height: CGFloat
    var body: some View {
        WebImage(url: URL(string: urlString))
            .resizable()
            .placeholder {
                Rectangle().foregroundColor(.gray)
            }
            .indicator(.activity)
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .preferredColorScheme(.light)
    }
}
