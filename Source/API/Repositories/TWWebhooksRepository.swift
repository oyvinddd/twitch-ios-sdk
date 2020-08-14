//
//  TWWebhooksRepository.swift
//  Twitch
//
//  Created by Øyvind Hauge on 14/08/2020.
//

import Foundation

final class TWWebhooksRepository: TWWebhooksAPI {
    let session = URLSession.shared
    
    func getSubscriptions(after: String?, first: String?, result: @escaping TWContainerBlock<[TWWebhookSub]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWWebhookSubRequest(after, first))
        session.dataTask(with: request, decodable: [TWWebhookSub].self, result: result).resume()
    }
}
