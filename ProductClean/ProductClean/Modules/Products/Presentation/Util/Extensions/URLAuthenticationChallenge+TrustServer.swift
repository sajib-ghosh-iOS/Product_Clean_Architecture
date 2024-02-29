//
//  URLAuthenticationChallenge+TrustServer.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 29/02/24.
//

import Foundation

extension URLAuthenticationChallenge {
    
    func trustServer(completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if self.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if let serverTrust = self.protectionSpace.serverTrust {
                let credential = URLCredential(trust: serverTrust)
                completionHandler(.useCredential, credential)
                return
            }
        }
        completionHandler(.performDefaultHandling, nil)
    }
}
