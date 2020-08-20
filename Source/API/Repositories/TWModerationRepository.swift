//
//  TWModerationRepository.swift
//  Twitch
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWModerationRepository: TWModerationAPI {
    let session: URLSession = URLSession.shared
    
    func getModerators(broadcasterId: String, userId: [String]?, after: String?, result: @escaping TWContainerBlock<[TWModerator]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWModeratorsRequest(broadcasterId, userId, after))
        session.dataTask(with: request, decodable: [TWModerator].self, result: result).resume()
    }
    
    func getModeratorEvents(broadcasterId: String, userId: [String]?, result: @escaping TWContainerBlock<[TWModeratorEvent]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWModeratorEventsRequest(broadcasterId, userId))
        session.dataTask(with: request, decodable: [TWModeratorEvent].self, result: result).resume()
    }
    
    func getBannedUsers(broadcasterId: String, userId: [String]?, after: String?, before: String?, result: @escaping TWContainerBlock<[TWBannedUser]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWBannedUsersRequest(broadcasterId, userId, after, before))
        session.dataTask(with: request, decodable: [TWBannedUser].self, result: result).resume()
    }
    
    func getBannedEvents(broadcasterId: String, userId: [String]?, after: String?, first: Int?, result: @escaping TWContainerBlock<[TWModeratorEvent]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWBannedEventsRequest(broadcasterId, userId, after, first))
        session.dataTask(with: request, decodable: [TWModeratorEvent].self, result: result).resume()
    }
    
    func checkAutomodStatus(broadcasterId: String, messages: [TWMessage], result: @escaping TWContainerBlock<[TWMessageStatus]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWCheckAutomodStatusRequest(broadcasterId, messages))
        session.dataTask(with: request, decodable: [TWMessageStatus].self, result: result).resume()
    }
}
