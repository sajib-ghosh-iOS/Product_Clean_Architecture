//
//  SwiftUIView+ToVC.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 28/02/24.
//

import Foundation
import SwiftUI
extension View {
    func toViewController() -> UIViewController {
        let viewController = UIHostingController(rootView: self)
        viewController.view.frame = UIScreen.main.bounds
        return viewController
    }
}

