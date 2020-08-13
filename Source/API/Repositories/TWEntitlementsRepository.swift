//
//  TWEntitlementsRepository.swift
//  Twitch
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWEntitlementsRepository: TWEntitlementsAPI {
    let session: URLSession = URLSession.shared
    
    func getCodeStatus(code: String, userId: Int, result: @escaping TWContainerBlock<[TWCodeStatus]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWCodeStatusRequest(code, userId))
        session.dataTask(with: request, decodable: [TWCodeStatus].self, result: result).resume()
    }
    
    func redeemCode(code: [String], userId: String, result: @escaping TWContainerBlock<[TWCodeStatus]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWRedeemCodeRequest(code, userId))
        session.dataTask(with: request, decodable: [TWCodeStatus].self, result: result).resume()
    }
}
