//
//  TWGamesRepository.swift
//  Twitch
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWGamesRepository: TWGamesAPI {
    let session: URLSession = URLSession.shared

    func getGames(id: String?, name: String?, result: @escaping TWContainerBlock<[TWGame]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWGamesRequest(id, name))
        session.dataTask(with: request, decodable: [TWGame].self, result: result).resume()
    }
    
    func getTopGames(after: String?, before: String?, first: Int?, result: @escaping TWContainerBlock<[TWGame]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWTopGamesRequest(after, before, first))
        session.dataTask(with: request, decodable: [TWGame].self, result: result).resume()
    }
}
