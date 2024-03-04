//
//  MockData.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 22/02/24.
//
import Foundation
@testable import ProductClean

class MockData {
    
    static let productList: [ProductListItemViewModel] = [.init(id: 1, title: "Title 1", description: "Description 1", price: "$100", category: "iPhone", image: imageURLString)]
    
    static let imageURLString = ""
    
}

struct SnapshotTolerance {
    static let perPixelTolerance: CGFloat = 6/256
    static let overallTolerance: CGFloat = 0.02
}


