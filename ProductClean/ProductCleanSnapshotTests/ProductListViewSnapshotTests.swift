//
//  ProductCleanSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
import FBSnapshotTestCase
import SwiftUI
@testable import ProductClean

final class ProductListViewSnapshotTests: SpashotTestWrapper {

    let viewModel = ProductListViewModelMock()
    var productListVC: UIViewController!
    let products = MockData.productList
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        productListVC = ProductListView(viewModel: viewModel).toViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        productListVC = nil
    }
    
    func testLaunchForProductListViewSuccess() {
        viewModel.products = products
        FBSnapshotVerifyView(productListVC.view, perPixelTolerance: SnapshotTolerance.perPixelTolerance, overallTolerance: SnapshotTolerance.overallTolerance)
    }
    
    func testLaunchForProductListViewFailure() {
        viewModel.isError = true
        FBSnapshotVerifyView(productListVC.view, perPixelTolerance: SnapshotTolerance.perPixelTolerance, overallTolerance: SnapshotTolerance.overallTolerance)
    }
}
