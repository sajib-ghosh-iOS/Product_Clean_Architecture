//
//  ProductListCellSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
@testable import ProductClean

final class ProductItemViewSnapshotTests: XCTestCase {

    var productListCellVC: UIViewController!
    
    override func setUp() {
        super.setUp()
        productListCellVC = ProductItemView(item: MockData.productList[0]).toViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        productListCellVC = nil
    }
    
    func testLaunchForProductListCellView() {
        productListCellVC.performSnapshotTests(named: "ProductListCellView")
    }

}
