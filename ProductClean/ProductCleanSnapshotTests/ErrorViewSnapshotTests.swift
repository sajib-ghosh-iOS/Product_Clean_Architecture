//
//  ErrorViewSnapshotTest.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
@testable import ProductClean

final class ErrorViewSnapshotTests: XCTestCase {

    var errorVC: UIViewController!
    
    override func setUp() {
        super.setUp()
        errorVC = ErrorView(errorTitle: "Error", errorDescription: "Error Description", retryAction: {}).toViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        errorVC = nil
    }

    func testLaunchForErrorView() {
        errorVC.performSnapshotTests(named: "ErrorView")
    }

}
