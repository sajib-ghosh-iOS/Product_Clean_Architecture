//
//  ProductCleanApp.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 20/02/24.
//

import SwiftUI

@main
struct ProductCleanApp: App {
    private let appDIContainer = AppDIContainer()
    var body: some Scene {
        WindowGroup {
            appDIContainer.productListView
        }
    }
}
