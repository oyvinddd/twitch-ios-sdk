//
//  TWUsersRepository.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWUsersRepository: TWUsersAPI {
    let session: URLSession = URLSession.shared
    
    func getUsers(id: String?, login: String?, result: @escaping TWContainerBlock<[TWUser]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWUsersRequest(id: id, login: login))
        session.dataTask(with: request, decodable: [TWUser].self, result: result).resume()
    }
    
    func getFollows(after: String?, first: Int?, fromId: String?, toId: String?, result: @escaping TWContainerBlock<[TWFollow]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWFollowsRequest(after: after, first: first, fromId: fromId, toId: toId))
        session.dataTask(with: request, decodable: [TWFollow].self, result: result).resume()
    }
    
    func getExtensions(result: @escaping TWContainerBlock<[TWExtension]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWExtensionsRequest())
        session.dataTask(with: request, decodable: [TWExtension].self, result: result).resume()
    }
    
    func getActiveExtensions(userId: String?, result: @escaping TWContainerBlock<[TWExtension]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWActiveExtensionsRequest(userId: userId))
        session.dataTask(with: request, decodable: [TWExtension].self, result: result).resume()
    }
    
    func createFollows(fromId: String, toId: String, allowNotifications: Bool?, result: @escaping TWNoContentBlock) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWCreateUserFollowsRequest(fromId: fromId, toId: toId, allowNotifications: allowNotifications))
        session.dataTask(with: request, result: result).resume()
    }
    
    func deleteFollows(fromId: String, toId: String, result: @escaping TWNoContentBlock) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWDeleteUserFollows(fromId: fromId, toId: toId))
        session.dataTask(with: request, result: result).resume()
    }
    
    func updateUser(description: String?, result: @escaping TWContainerBlock<[TWUser]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWUpdateUserRequest(description))
        session.dataTask(with: request, decodable: [TWUser].self, result: result).resume()
    }
}
