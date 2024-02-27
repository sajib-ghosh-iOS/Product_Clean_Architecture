//
//  SpashotTestWrapper.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 23/02/24.
//

import Foundation
import FBSnapshotTestCase

class SpashotTestWrapper: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        //recordMode = true
        fileNameOptions = .OS
    }
}
