//
//  ProductListLayoutSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
import FBSnapshotTestCase
import SwiftUI
@testable import ProductClean

final class ProductListLayoutSnapshotTests: SpashotTestWrapper {

    lazy var productListLayoutVC : UIHostingController<ProductListLayout>? = {
        let productListLayoutVC = ProductListLayout(items: MockData.productList)
        return UIHostingController(rootView: productListLayoutVC)
    }()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        window.rootViewController = productListLayoutVC
        window.makeKeyAndVisible()
        productListLayoutVC?.view.frame = UIScreen.main.bounds
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        productListLayoutVC = nil
    }
    
    func testLaunchForProductListLayoutView() {
        let expectation = XCTestExpectation()
        let result = XCTWaiter.wait(for: [expectation], timeout: 10.0)
        FBSnapshotVerifyView(productListLayoutVC?.view ?? UIView(), perPixelTolerance: SnapshotTolerance.perPixelTolerance, overallTolerance: SnapshotTolerance.overallTolerance)
        XCTAssertEqual(result, .timedOut)
    }

}
