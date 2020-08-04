//
//  Twitch.swift
//  Screencast
//
//  Created by Øyvind Hauge on 20/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public class Twitch: NSObject {
    
    public static var config: TWConfig!
    public static var credentials: TWCredentials!
    
    /// Repositories
    fileprivate static let usersRepository = TWUsersRepository()
    fileprivate static let gamesRepository = TWGamesRepository()
    fileprivate static let clipsRepository = TWClipsRepository()
    fileprivate static let videosRepository = TWVideosRepository()
    fileprivate static let streamsRepository = TWStreamsRepository()
    fileprivate static let moderationRepository = TWModerationRepository()
    fileprivate static let entitlementsRepository = TWEntitlementsRepository()
    fileprivate static let searchRepository = TWSearchRepository()
    fileprivate static let tagsRepository = TWTagsRepository()
    
    class func initialize(clientId: String, config: TWConfig) {
        self.credentials = TWCredentials(clientId: clientId)
        self.config = config
    }
}

// MARK: Twith Users API

extension Twitch {
    
    public struct Users {
        public static func getUsers(id: String? = nil, login: String? = nil, result: @escaping TWContainerBlock<[TWUser]>) {
            usersRepository.getUsers(id: id, login: login, result: result)
        }
        
        public static func getFollows(after: String? = nil, first: Int? = nil, fromId: String? = nil, toId: String? = nil, result: @escaping TWContainerBlock<[TWFollow]>) {
            usersRepository.getFollows(after: after, first: first, fromId: fromId, toId: toId, result: result)
        }
        
        public static func getExtensions(result: @escaping TWContainerBlock<[TWExtension]>) {
            usersRepository.getExtensions(result: result)
        }
        
        public static func createUserFollows(fromId: String, toId: String, allowNotifications: Bool? = nil, result: @escaping TWNoContentBlock) {
            usersRepository.createFollows(fromId: fromId, toId: toId, allowNotifications: allowNotifications, result: result)
        }
    }
}

// MARK: Twitch Games API

extension Twitch {
    
    public struct Games {
        public static func getGames(id: String? = nil, title: String? = nil, result: @escaping TWContainerBlock<[TWGame]>) {
            gamesRepository.getGames(id: id, title: title, result: result)
        }
        
        public static func getTopGames(after: String? = nil, before: String? = nil, first: Int? = nil, result: @escaping TWContainerBlock<[TWGame]>) {
            gamesRepository.getTopGames(after: after, before: before, first: first, result: result)
        }
    }
}

// MARK: Twitch Videos API

extension Twitch {
    
    public struct Videos {
        public static func getVideos(id: String, userId: String, gameId: String, result: @escaping TWContainerBlock<[TWVideo]>) {
            videosRepository.getVideos(id: id, userId: userId, gameId: gameId, result: result)
        }
    }
}

// MARK: Twitch Clips API

extension Twitch {
    
    public struct Clips {
        public static func getClips(broadcasterId: String, gameId: String, id: String, result: @escaping TWContainerBlock<[TWClip]>) {
            clipsRepository.getClips(broadcasterId: broadcasterId, gameId: gameId, id: id, result: result)
        }
        
        public static func createClip(broadcasterId: String, hasDelay: Bool?, result: @escaping TWContainerBlock<[TWClipInfo]>) {
            clipsRepository.createClip(broadcasterId: broadcasterId, hasDelay: hasDelay, result: result)
        }
    }
}

// MARK: Twitch Stream API

extension Twitch {
    
    public struct Streams {
        public static func getStreamKey(broadcasterId: String, result: @escaping TWContainerBlock<TWStreamKey>) {
            streamsRepository.getStreamKey(broadcasterId: broadcasterId, result: result)
        }
        
        public static func getStreams(after: String? = nil, before: String? = nil,
                               first: Int? = nil, gameId: String? = nil, language: String? = nil,
                               userId: String? = nil, userLogin: String? = nil, result: @escaping TWContainerBlock<[TWStream]>) {
            streamsRepository.getStreams(after: after, before: before, first: first, gameId: gameId, language: language, userId: userId, userLogin: userLogin, result: result)
        }
        
        public static func createStreamMarker(userId: String, description: String? = nil, result: @escaping TWContainerBlock<TWStreamMarker>) {
            streamsRepository.createStreamMarker(userId: userId, description: description, result: result)
        }
        
        public static func getChannelInfo(broadcatserId: String, result: @escaping TWContainerBlock<TWChannelInfo>) {
            streamsRepository.getChannelInfo(broadcatserId: broadcatserId, result: result)
        }
    }
}

// MARK: Twitch Moderation API

extension Twitch {
    
    public struct Moderation {
        public static func getModerators(broadcasterId: String, userId: String? = nil, after: String? = nil, result: @escaping TWContainerBlock<[TWModerator]>) {
            moderationRepository.getModerators(broadcasterId: broadcasterId, userId: userId, after: after, result: result)
        }
        
        public static func getModeratorEvents(broadcasterId: String, userId: String? = nil, result: @escaping TWContainerBlock<[TWModeratorEvent]>) {
            moderationRepository.getModeratorEvents(broadcasterId: broadcasterId, userId: userId, result: result)
        }
        
        public static func getBannedUsers(broadcasterId: String, userId: String? = nil, after: String? = nil, before: String? = nil, result: @escaping TWContainerBlock<[TWBannedUser]>) {
            moderationRepository.getBannedUsers(broadcasterId: broadcasterId, userId: userId, after: after, before: before, result: result)
        }
    }
}

// MARK: Twitch Entitlements API

extension Twitch {
    
    public struct Entitlements {
        public static func getCodeStatus(code: String, userId: Int, result: @escaping TWContainerBlock<[TWCodeStatus]>) {
            entitlementsRepository.getCodeStatus(code: code, userId: userId, result: result)
        }
    }
}

// MARK: Twitch Tags API

extension Twitch {
    
    public struct Tags {
        public static func getAllTags(tagId: String?, after: String?, first: Int?, result: @escaping TWContainerBlock<[TWStreamTag]>) {
            tagsRepository.getAllTags(tagId: tagId, after: after, first: first, result: result)
        }
    }
}

// MARK: Twitch Search API

extension Twitch {
    
    public struct Search {
        public static func searchCategories(query: String, first: Int? = nil, after: String? = nil, result: @escaping TWContainerBlock<[TWGame]>) {
            searchRepository.searchCategories(query: query, first: first, after: after, result: result)
        }
    }
}
