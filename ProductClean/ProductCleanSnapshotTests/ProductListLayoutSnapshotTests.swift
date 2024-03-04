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

    var productListLayoutVC: UIViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        productListLayoutVC = ProductListLayout(items: MockData.productList).toViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        productListLayoutVC = nil
    }
    
    func testLaunchForProductListLayoutView() {
        FBSnapshotVerifyView(productListLayoutVC?.view ?? UIView(), perPixelTolerance: SnapshotTolerance.perPixelTolerance, overallTolerance: SnapshotTolerance.overallTolerance)
    }

}
