//
//  ProductCleanApp.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI
import Kingfisher
@main
struct ProductCleanApp: App {
    private let appDIContainer = AppDIContainer()
    private let imageAuthenticationChallenge = ImageDownloadAuthenticationChallenge()
    var body: some Scene {
        WindowGroup {
            appDIContainer.productListView
        }
    }
    init() {
        ImageDownloader.default.authenticationChallengeResponder = imageAuthenticationChallenge
    }
}
