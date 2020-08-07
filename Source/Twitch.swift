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
    
    private static let usersRepository = TWUsersRepository()
    private static let gamesRepository = TWGamesRepository()
    private static let clipsRepository = TWClipsRepository()
    private static let videosRepository = TWVideosRepository()
    private static let streamsRepository = TWStreamsRepository()
    private static let moderationRepository = TWModerationRepository()
    private static let entitlementsRepository = TWEntitlementsRepository()
    private static let searchRepository = TWSearchRepository()
    private static let tagsRepository = TWTagsRepository()
    private static let subsRepository = TWSubsRepository()
    
    public class func initialize(clientId: String, config: TWConfig) {
        self.credentials = TWCredentials(clientId: clientId)
        self.config = config
    }
}

// MARK: Twith Users API

extension Twitch {
    
    public struct Users {
        
        
        /// Gets information about one or more specified Twitch users. Users are identified by optional user IDs and/or login name.
        /// If neither a user ID nor a login name is specified, the user is looked up by Bearer token. The response has a JSON payload with a data field containing an array of user-information elements.
        /// - Parameters:
        ///   - id: User ID. Multiple user IDs can be specified. Limit: 100.
        ///   - login: User login name. Multiple login names can be specified. Limit: 100.
        ///   - result: Result block
        public static func getUsers(id: String? = nil, login: String? = nil, result: @escaping TWContainerBlock<[TWUser]>) {
            usersRepository.getUsers(id: id, login: login, result: result)
        }
        
        public static func getFollows(after: String? = nil, first: Int? = nil, fromId: String? = nil, toId: String? = nil, result: @escaping TWContainerBlock<[TWFollow]>) {
            usersRepository.getFollows(after: after, first: first, fromId: fromId, toId: toId, result: result)
        }
        
        public static func getExtensions(result: @escaping TWContainerBlock<[TWExtension]>) {
            usersRepository.getExtensions(result: result)
        }
        
        func getActiveExtensions(userId: String? = nil, result: @escaping TWContainerBlock<[TWExtension]>) {
            usersRepository.getActiveExtensions(userId: userId, result: result)
        }
        
        public static func createUserFollows(fromId: String, toId: String, allowNotifications: Bool? = nil, result: @escaping TWNoContentBlock) {
            usersRepository.createFollows(fromId: fromId, toId: toId, allowNotifications: allowNotifications, result: result)
        }
    }
}

// MARK: Twitch Games API

extension Twitch {
    
    public struct Games {
        public static func getGames(id: String? = nil, name: String? = nil, result: @escaping TWContainerBlock<[TWGame]>) {
            gamesRepository.getGames(id: id, name: name, result: result)
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
        
        public static func getStreamTags(broadcasterId: String, result: @escaping TWContainerBlock<[TWStreamTag]>) {
            streamsRepository.getStreamTags(broadcasterId: broadcasterId, result: result)
        }
        
        public static func replaceStreamTags(broadcasterId: String, tagIds: [String]? = nil, result: @escaping TWNoContentBlock) {
            streamsRepository.replaceStreamTags(broadcasterId: broadcasterId, tagIds: tagIds, result: result)
        }
        
        public static func createStreamMarker(userId: String, description: String? = nil, result: @escaping TWContainerBlock<TWStreamMarker>) {
            streamsRepository.createStreamMarker(userId: userId, description: description, result: result)
        }
        
        public static func getChannelInfo(broadcatserId: String, result: @escaping TWContainerBlock<TWChannelInfo>) {
            streamsRepository.getChannelInfo(broadcatserId: broadcatserId, result: result)
        }
        
        public static func modifyChannelInfo(broadcasterId: String, gameId: String?, broadcasterLanguage: String?, title: String?, result: @escaping TWNoContentBlock) {
            streamsRepository.modifyChannelInfo(broadcasterId: broadcasterId, gameId: gameId,
                                                broadcasterLanguage: broadcasterLanguage, title: title, result: result)
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
        
        /// Gets the list of all stream tags defined by Twitch, optionally filtered by tag ID(s). The response has a JSON payload with a data field containing an array of tag
        /// elements and a pagination field containing information required to query for more tags.
        /// - Parameters:
        ///   - tagId: ID of a tag. Multiple IDs can be specified, separated by ampersands. If provided, only the specified tag(s) is(are) returned. Maximum of 100.
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response. The cursor value specified here is from the pagination response field of a prior query.
        ///   - first: Maximum number of objects to return. Maximum: 100. Default: 20.
        ///   - result: Result block
        public static func getAllTags(tagId: String? = nil, after: String? = nil, first: Int? = nil, result: @escaping TWContainerBlock<[TWStreamTag]>) {
            tagsRepository.getAllTags(tagId: tagId, after: after, first: first, result: result)
        }
    }
}

// MARK: Twitch Search API

extension Twitch {
    
    public struct Search {
        
        /// Returns a list of games or categories that match the query via name either entirely or partially.
        /// - Parameters:
        ///   - query: URl encoded search query
        ///   - first: Maximum number of objects to return. Maximum: 100. Default: 20.
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response. The cursor value specified here is from the pagination response field of a prior query.
        ///   - result: Result block
        public static func searchCategories(query: String, first: Int? = nil, after: String? = nil, result: @escaping TWContainerBlock<[TWGame]>) {
            searchRepository.searchCategories(query: query, first: first, after: after, result: result)
        }
        
        /// Returns a list of channels (users who have streamed within the past 6 months) that match the query via channel name or description either entirely or partially.
        /// Results include both live and offline channels. Online channels will have additional metadata (e.g. started_at, tag_ids). See sample response for distinction.
        /// - Parameters:
        ///   - query: URl encoded search query
        ///   - first: Maximum number of objects to return. Maximum: 100. Default: 20.
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response. The cursor value specified here is from the pagination response field of a prior query.
        ///   - liveOnly: Filter results for live streams only. Default: false
        ///   - result: Result block
        public static func searchChannels(query: String, first: Int? = nil, after: String? = nil, liveOnly: Bool? = nil, result: @escaping TWContainerBlock<[TWChannel]>) {
            searchRepository.searchChannels(query: query, first: first, after: after, liveOnly: liveOnly, result: result)
        }
    }
}

// MARK: Twitch Subscriptions API

extension Twitch {
    
    public struct Subscriptions {
        
        /// Get all of a broadcaster’s subscriptions.
        /// - Parameters:
        ///   - broadcasterId: User ID of the broadcaster. Must match the User ID in the Bearer token.
        ///   - userId: Returns broadcaster’s subscribers. Unique identifier of account to get subscription status of. Accepts up to 100 values.
        ///   - result: Result block
        public static func getBroadcasterSubscriptions(broadcasterId: String, userId: String? = nil, result: @escaping TWContainerBlock<[TWSubscription]>) {
            subsRepository.getBroadcasterSubscriptions(broadcasterId: broadcasterId, userId: userId, result: result)
        }
    }
}
