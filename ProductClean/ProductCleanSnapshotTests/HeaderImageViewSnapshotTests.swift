//
//  HeaderImageViewSnapshotTests.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 21/02/24.
//

import XCTest
@testable import ProductClean

final class HeaderImageViewSnapshotTests: XCTestCase {

   var headerImageVC: UIViewController!
    
    override func setUp() {
        super.setUp()
        headerImageVC = HeaderImageView(urlString: MockData.imageURLString, height: 300).toViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        headerImageVC = nil
    }
    
    
    func testLaunchForHeaderImageView() {
        headerImageVC.performSnapshotTests(named: "HeaderImageView")
    }

}
