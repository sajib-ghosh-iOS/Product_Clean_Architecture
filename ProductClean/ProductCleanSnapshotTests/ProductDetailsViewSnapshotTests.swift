//
//  ProductDetailsSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
import FBSnapshotTestCase
import SwiftUI
@testable import ProductClean

final class ProductDetailsSnapshotTests: SpashotTestWrapper {

    lazy var productDetailsVC : UIHostingController<ProductDetailsView>? = {
        let productDetailsVC = ProductDetailsView(item: MockData.productList[0])
        return UIHostingController(rootView: productDetailsVC)
    }()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        window.rootViewController = productDetailsVC
        window.makeKeyAndVisible()
        productDetailsVC?.view.frame = UIScreen.main.bounds
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        productDetailsVC = nil
    }
    
    func testLaunchForProductDetailsView() {
        let expectation = XCTestExpectation(description: "")
        let result = XCTWaiter.wait(for: [expectation], timeout: 2.0) // wait and store the result
        FBSnapshotVerifyView(productDetailsVC?.view ?? UIView())
        XCTAssertEqual(result, .timedOut)
    }

}
