//
//  TWBitsRepository.swift
//  Screencast
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
    
    func getLeaderboard(count: Int?, period: String?, startedAt: String?, userId: String?, result: TWContainerBlock<[TWLeaderboard]>) {
    }
}
