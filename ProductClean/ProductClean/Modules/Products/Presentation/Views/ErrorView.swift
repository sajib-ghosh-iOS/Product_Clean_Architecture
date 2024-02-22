//
//  ErrorView.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI

struct ErrorView: View {
    let errorTitle: String
    let errorDescription: String
    let retryAction: () -> Void
    var body: some View {
        VStack {
            ContentUnavailableView(errorTitle,
                                   systemImage: AppConstant.errorImage,
                                   description: Text(errorDescription))
            .frame(height: 200)
            Button(AppConstant.retry) {
                retryAction()
            }
        }
        .animation(.easeInOut, value: 0.5)
        .preferredColorScheme(.light)
    }
}
