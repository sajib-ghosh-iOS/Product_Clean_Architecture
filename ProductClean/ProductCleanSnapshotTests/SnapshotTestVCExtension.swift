//
//  SnapshotTestVCExtension.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 05/03/24.
//

import Foundation
import SnapshotTesting

extension UIViewController {
    func performSnapshotTests(
            named name: String,
            testName: String = "Snapshot") {
            assertSnapshot(
                matching: self,
                as: .image(precision: 0.9),
                named: name,
                testName: testName)
        }
}
