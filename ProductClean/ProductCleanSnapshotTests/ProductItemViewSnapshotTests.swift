//
//  ProductListCellSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
import FBSnapshotTestCase
import SwiftUI
@testable import ProductClean

final class ProductItemViewSnapshotTests: FBSnapshotTestCase {

    lazy var productListCellVC : UIHostingController<ProductItemView>? = {
        let productListCellVC = ProductItemView(item: MockData.productList[0])
        return UIHostingController(rootView: productListCellVC)
    }()
    
    override func setUp() {
        super.setUp()
        //recordMode = true
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        window.rootViewController = productListCellVC
        window.makeKeyAndVisible()
        productListCellVC?.view.frame = UIScreen.main.bounds
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        productListCellVC = nil
    }
    
    func testLaunchForProductListCellView() {
        FBSnapshotVerifyView(productListCellVC?.view ?? UIView())
    }

}
