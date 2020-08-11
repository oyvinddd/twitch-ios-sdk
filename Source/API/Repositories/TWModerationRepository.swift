//
//  TWModerationRepository.swift
//  Screencast
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWModerationRepository: TWModerationAPI {
    let session: URLSession = URLSession.shared
    
    func getModerators(broadcasterId: String, userId: [String]?, after: String?, result: @escaping TWContainerBlock<[TWModerator]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWModeratorsRequest(broadcasterId, userId: userId, after: after))
        session.dataTask(with: request, decodable: [TWModerator].self, result: result).resume()
    }
    
    func getModeratorEvents(broadcasterId: String, userId: String? = nil, result: @escaping TWContainerBlock<[TWModeratorEvent]>) {
        let request = URLRequestBuilder.buildOpenAPIRequest(for: TWModeratorEventsRequest(broadcasterId, userId: userId))
        session.dataTask(with: request, decodable: [TWModeratorEvent].self, result: result).resume()
    }
    
    func getBannedUsers(broadcasterId: String, userId: String?, after: String?, before: String?, result: @escaping TWContainerBlock<[TWBannedUser]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWBannedUsersRequest(broadcasterId, userId: userId, after: after, before: before))
        session.dataTask(with: request, decodable: [TWBannedUser].self, result: result).resume()
    }
    
    func getBannedEvents(broadcasterId: String, userId: String?, after: String?, first: String?, result: @escaping TWContainerBlock<[TWModeratorEvent]>) {
        
    }
    
    func checkAutomodStatus(broadcasterId: String, messages: [TWMessage], result: @escaping TWContainerBlock<[TWMessageStatus]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWCheckAutomodStatusRequest(broadcasterId, messages: messages))
        session.dataTask(with: request, decodable: [TWMessageStatus].self, result: result).resume()
    }
}
