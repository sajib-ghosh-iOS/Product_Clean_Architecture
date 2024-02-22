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

final class ProductCleanSnapshotTests: FBSnapshotTestCase {

    let viewModel = ProductListViewModelMock()
    lazy var productListVC : UIHostingController<ProductListView>? = {
        let productListView = ProductListView(viewModel: viewModel)
        return UIHostingController(rootView: productListView)
    }()
    
    let products = MockData.productList
    
    override func setUp() {
        super.setUp()
        //recordMode = true
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        window.rootViewController = productListVC
        window.makeKeyAndVisible()
        productListVC?.view.frame = UIScreen.main.bounds
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        productListVC = nil
    }
    
    func testLaunchForProductViewSuccess() {
        viewModel.products = products
        FBSnapshotVerifyView(productListVC?.view ?? UIView())
    }
    func testLaunchForProductViewFailure() {
        viewModel.isError = true
        FBSnapshotVerifyView(productListVC?.view ?? UIView())
    }
    

}
