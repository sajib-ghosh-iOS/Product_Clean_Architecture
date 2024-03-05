//
//  ProductListLayoutSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
//import FBSnapshotTestCase
import SwiftUI
@testable import ProductClean

final class ProductListLayoutSnapshotTests: XCTestCase {

    var productListLayoutVC: UIViewController!
    
    override func setUp() {
        super.setUp()
        productListLayoutVC = ProductListLayout(items: MockData.productList).toViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        productListLayoutVC = nil
    }
    
    func testLaunchForProductListLayoutView() {
        productListLayoutVC.performSnapshotTests(named: "ProductListLayoutView")
    }

}
