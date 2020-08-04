//
//  TWGamesRepository.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWGamesRepository: TWGamesAPI {
    let session: URLSession = URLSession.shared

    func getGames(id: String?, title: String?, result: @escaping TWContainerBlock<[TWGame]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWGamesRequest(id: id, title: title))
        session.dataTask(with: request, decodable: [TWGame].self, result: result).resume()
    }
    
    func getTopGames(after: String?, before: String?, first: Int?, result: @escaping TWContainerBlock<[TWGame]>) {
        let request = URLRequestBuilder.buildOpenAPIRequest(for: TWTopGamesRequest(after: after, before: before, first: first))
        session.dataTask(with: request, decodable: [TWGame].self, result: result).resume()
    }
}
