//
//  ProductCleanSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
@testable import ProductClean

final class ProductListViewSnapshotTests: XCTestCase {

    let viewModel = ProductListViewModelMock()
    var productListVC: UIViewController!
    let products = MockData.productList
    
    override func setUp() {
        super.setUp()
        productListVC = ProductListView(viewModel: viewModel).toViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        productListVC = nil
    }
    
    func testLaunchForProductListViewSuccess() {
        viewModel.products = products
        productListVC.performSnapshotTests(named: "ProductListViewSuccess")
    }
    
    func testLaunchForProductListViewFailure() {
        viewModel.isError = true
        productListVC.performSnapshotTests(named: "ProductListViewFailure")
    }
}
