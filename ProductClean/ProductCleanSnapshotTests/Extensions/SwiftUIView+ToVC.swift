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
        let vc = UIHostingController(rootView: self)
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        window.rootViewController = vc
        window.makeKeyAndVisible()
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
