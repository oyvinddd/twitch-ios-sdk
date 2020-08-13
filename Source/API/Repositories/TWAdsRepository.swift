//
//  TWAdsRepository.swift
//  Twitch
//
//  Created by Øyvind Hauge on 12/08/2020.
//

import Foundation

final class TWAdsRepository: TWAdsAPI {
    let session = URLSession.shared
    
    func startCommercial(broadcasterId: String, length: Int, result: @escaping TWContainerBlock<[TWCommercial]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWStartCommercialRequest(broadcasterId, length))
        session.dataTask(with: request, decodable: [TWCommercial].self, result: result).resume()
    }
}
