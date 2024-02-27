//
//  ImageDownloadAuthenticationChallenge.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 27/02/24.
//

import Foundation
import Kingfisher

class ImageDownloadAuthenticationChallenge : AuthenticationChallengeResponsible {
    func downloader(_ downloader: ImageDownloader, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if let serverTrust = challenge.protectionSpace.serverTrust {
                let credential = URLCredential(trust: serverTrust)
                completionHandler(.useCredential, credential)
                return
            }
        }
        completionHandler(.performDefaultHandling, nil)
    }
}
