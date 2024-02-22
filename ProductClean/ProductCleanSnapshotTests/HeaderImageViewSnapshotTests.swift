//
//  HeaderImageViewSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
import FBSnapshotTestCase
import SwiftUI
@testable import ProductClean

final class HeaderImageViewSnapshotTests: SpashotTestWrapper {

    lazy var headerImageVC : UIHostingController<HeaderImageView>? = {
        let headerImageVC = HeaderImageView(urlString: MockData.imageURLStrings[0], height: 300)
        return UIHostingController(rootView: headerImageVC)
    }()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        window.rootViewController = headerImageVC
        window.makeKeyAndVisible()
        headerImageVC?.view.frame = UIScreen.main.bounds
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        headerImageVC = nil
    }
    
    func testLaunchForHeaderImageView() {
        let expectation = XCTestExpectation(description: "")
        let result = XCTWaiter.wait(for: [expectation], timeout: 3.0) // wait and store the result
        FBSnapshotVerifyView(headerImageVC?.view ?? UIView())
        XCTAssertEqual(result, .timedOut)
    }

}
