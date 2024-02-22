//
//  MockData.swift
//  ProductCleanSnapshotTests
//
//  Created by Sajib Ghosh on 22/02/24.
//

@testable import ProductClean

class MockData {
    static let productList: [ProductListItemViewModel] = [.init(id: 1, title: "Title 1", description: "Description 1", price: 100, image: imageURLStrings[0]),
                                                          .init(id: 1, title: "Title 2", description: "Description 2", price: 200, image: imageURLStrings[1])]
    
    static let imageURLStrings = ["https://cdn.dummyjson.com/product-images/50/thumbnail.jpg",
                                  "https://cdn.dummyjson.com/product-images/60/thumbnail.jpg"]
    
}


