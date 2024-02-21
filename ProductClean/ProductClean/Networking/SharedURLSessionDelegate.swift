//
//  SharedURLSessionDelegate.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 21/02/24.
//

import Foundation

final class SharedURLSessionDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge)
    async -> (URLSession.AuthChallengeDisposition, URLCredential?) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if let serverTrust = challenge.protectionSpace.serverTrust {
                let credential = URLCredential(trust: serverTrust)
                return (.useCredential, credential)
            }
        }
        return (.performDefaultHandling, nil)
    }
}
