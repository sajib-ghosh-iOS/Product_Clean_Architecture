//
//  ErrorViewSnapshotTest.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
import FBSnapshotTestCase
import SwiftUI
@testable import ProductClean

final class ErrorViewSnapshotTests: SpashotTestWrapper {

    var errorVC: UIViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        errorVC = ErrorView(errorTitle: "Error", errorDescription: "Error Description", retryAction: {}).toViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        errorVC = nil
    }
    
    func testLaunchForErrorView() {
        FBSnapshotVerifyView(errorVC.view, perPixelTolerance: SnapshotTolerance.perPixelTolerance, overallTolerance: SnapshotTolerance.overallTolerance)
    }

}
