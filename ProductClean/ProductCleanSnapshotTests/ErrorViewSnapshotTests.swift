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

final class ErrorViewSnapshotTests: FBSnapshotTestCase {

    lazy var errorVC : UIHostingController<ErrorView>? = {
        let errorVC = ErrorView(errorTitle: "Error", errorDescription: "Error Description", retryAction: {})
        return UIHostingController(rootView: errorVC)
    }()
    
    override func setUp() {
        super.setUp()
        //recordMode = true
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        window.rootViewController = errorVC
        window.makeKeyAndVisible()
        errorVC?.view.frame = UIScreen.main.bounds
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        errorVC = nil
    }
    
    func testLaunchForErrorView() {
        FBSnapshotVerifyView(errorVC?.view ?? UIView())
    }

}
