//
//  ProductDetailsSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
@testable import ProductClean

final class ProductDetailsSnapshotTests: XCTestCase {

    var productDetailsVC: UIViewController!
    
    override func setUp() {
        super.setUp()
        productDetailsVC = ProductDetailsView(item: MockData.productList[0]).toViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        productDetailsVC = nil
    }
    
    func testLaunchForProductDetailsView() {
        productDetailsVC.performSnapshotTests(named: "ProductDetailsView")
    }

}
