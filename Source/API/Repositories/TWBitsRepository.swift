//
//  TWBitsRepository.swift
//  Twitch
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWBitsRepository: TWBitsAPI {    
    let session: URLSession = URLSession.shared
    
    func getCheermotes(broadcasterId: String?, result: @escaping TWContainerBlock<[TWCheermoteContainer]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWCheermotesRequest(broadcasterId))
        session.dataTask(with: request, decodable: [TWCheermoteContainer].self, result: result).resume()
    }
    
    func getLeaderboard(count: Int?, period: String?, startedAt: String?, userId: String?, result: @escaping TWContainerBlock<[TWLeaderboard]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWLeaderboardRequest(count, period, startedAt, userId))
        session.dataTask(with: request, decodable: [TWLeaderboard].self, result: result).resume()
    }
    
    func getExtensionTransactions(extensionId: String, id: [String]?, after: String?, first: Int?,
                                  result: @escaping TWContainerBlock<[TWTransaction]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWTransactionsRequest(extensionId, id, after, first))
        session.dataTask(with: request, decodable: [TWTransaction].self, result: result).resume()
    }
}
