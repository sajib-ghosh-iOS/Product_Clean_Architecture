//
//  NetworkConfigurable.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 24/02/24.
//

import Foundation

protocol NetworkConfigurable {
    var baseURL: String { get }
    var headers: [String: String] { get }
}

class ApiDataNetworkConfig: NetworkConfigurable {
    let baseURL: String
    let headers: [String: String]
    
     init(
        baseURL: String,
        headers: [String: String] = [:]
     ) {
        self.baseURL = baseURL
        self.headers = headers
    }
}
