//
//  TWClipsRepository.swift
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWClipsRepository: TWClipsAPI {
    let session: URLSession = URLSession.shared
    
    func getClips(broadcasterId: String?, gameId: String?, id: [String]?, result: @escaping TWContainerBlock<[TWClip]>) {
        let request = URLRequestBuilder.buildOpenAPIRequest(for: TWClipsRequest(broadcasterId: broadcasterId, gameId: gameId, id: id))
        session.dataTask(with: request, decodable: [TWClip].self, result: result).resume()
    }
    
    func createClip(broadcasterId: String, hasDelay: Bool?, result: @escaping TWContainerBlock<[TWClipInfo]>) {
        let request = URLRequestBuilder.buildOpenAPIRequest(for: TWCreateClipRequest(broadcasterId, hasDelay: hasDelay))
        session.dataTask(with: request, decodable: [TWClipInfo].self, result: result).resume()
    }
}
