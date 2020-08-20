//
//  TWVideosRepository.swift
//  Twitch
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWVideosRepository: TWVideosAPI {
    let session: URLSession = URLSession.shared
    
    func getVideos(id: [String], userId: String, gameId: String, after: String?, before: String?,
                   first: String?, language: String?, period: String?, sort: String?, type: String?, result: @escaping TWContainerBlock<[TWVideo]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWVideosRequest(id, userId, gameId, after, before, first, language, period, sort, type))
        session.dataTask(with: request, decodable: [TWVideo].self, result: result).resume()
    }
}
