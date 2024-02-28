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

   var headerImageVC: UIViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        headerImageVC = HeaderImageView(urlString: MockData.imageURLStrings[0], height: 300).toViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        headerImageVC = nil
    }
    
    func testLaunchForHeaderImageView() {
        let expectation = XCTestExpectation()
        let result = XCTWaiter.wait(for: [expectation], timeout: 10.0)
        FBSnapshotVerifyView(headerImageVC?.view ?? UIView(), perPixelTolerance: SnapshotTolerance.perPixelTolerance, overallTolerance: SnapshotTolerance.overallTolerance)
        XCTAssertEqual(result, .timedOut)
    }

}
