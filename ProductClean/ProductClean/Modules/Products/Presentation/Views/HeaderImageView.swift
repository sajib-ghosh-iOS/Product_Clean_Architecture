//
//  HeaderImageView.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI
import Kingfisher
struct HeaderImageView: View {
    let urlString: String
    let height: CGFloat
    var body: some View {
        KFImage(URL(string: urlString))
            .placeholder {
                Rectangle().foregroundColor(.gray)
            }
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .aspectRatio(120.0/63.0, contentMode: .fit)
            .cornerRadius(4.0)
            .preferredColorScheme(.light)
    }
}
