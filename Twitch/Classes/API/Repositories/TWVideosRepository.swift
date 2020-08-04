//
//  TWVideosRepository.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWVideosRepository: TWVideosAPI {
    let session: URLSession = URLSession.shared
    
    func getVideos(id: String, userId: String, gameId: String, result: @escaping TWContainerBlock<[TWVideo]>) {
        let request = URLRequestBuilder.buildOpenAPIRequest(for: TWVideosRequest(id: id, userId: userId, gameId: gameId))
        session.dataTask(with: request, decodable: [TWVideo].self, result: result).resume()
    }
}
