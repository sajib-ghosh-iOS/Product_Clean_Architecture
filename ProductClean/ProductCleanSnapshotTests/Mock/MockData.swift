//
//  MockData.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 22/02/24.
//
import Foundation
@testable import ProductClean

class MockData {
    
    static let productList: [ProductListItemViewModel] = [.init(id: 1, title: "Title 1", description: "Description 1", price: "$100", category: "iPhone", image: imageURLStrings[0])]
    
    static let imageURLStrings = ["https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
                                  "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg"]
    
}

struct SnapshotTolerance {
    static let perPixelTolerance: CGFloat = 6/256
    static let overallTolerance: CGFloat = 0.02
}


