//
//  ImageDownloadAuthenticationChallenge.swift
//  ProductClean
//
//  Created by Sajib Ghosh on 27/02/24.
//

import Foundation
import Kingfisher

final class ImageDownloadAuthenticationChallenge : AuthenticationChallengeResponsible {
    func downloader(_ downloader: ImageDownloader, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        challenge.trustServer { challangeDisposition, credential in
            completionHandler(challangeDisposition,credential)
        }
    }
}
