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

    var productDetailsVC: UIViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        productDetailsVC = ProductDetailsView(item: MockData.productList[0]).toViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        productDetailsVC = nil
    }
    
    func testLaunchForProductDetailsView() {
        FBSnapshotVerifyView(productDetailsVC?.view ?? UIView(), perPixelTolerance: SnapshotTolerance.perPixelTolerance, overallTolerance: SnapshotTolerance.overallTolerance)
    }

}
