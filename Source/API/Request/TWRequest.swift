//
//  TWRequest.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

// MARK: All API Endpoints (including V5 ones)
typealias TWEndpoint = String

struct Endpoints {
    /// New API
    fileprivate static let helix: TWEndpoint = "/helix"
    /// Old V5 API
    fileprivate static let kraken: TWEndpoint = "/kraken"
    /// Users
    static let users: TWEndpoint = "\(helix)/users"
    static let userFollows: TWEndpoint = "\(users)/follows"
    /// Games
    static let games: TWEndpoint = "\(helix)/games"
    static let topGames: TWEndpoint = "\(games)/top"
    /// Search
    static let search: TWEndpoint = "\(helix)/search"
    static let searchCategories: TWEndpoint = "\(search)/categories"
    static let searchChannels: TWEndpoint = "\(search)/channels"
    /// Streams
    static let streams: TWEndpoint = "\(helix)/streams"
    static let streamTags: TWEndpoint = "\(streams)/tags"
    static let streamKey: TWEndpoint = "\(streams)/key"
    static let streamMarker: TWEndpoint = "\(streams)/markers"
    /// Videos
    static let videos: TWEndpoint = "\(helix)/videos"
    /// Tags
    static let allTags: TWEndpoint = "\(helix)/tags/streams"
    /// Moderation
    static let moderation: TWEndpoint = "\(helix)/moderation"
    static let checkAutomodStatus: TWEndpoint = "\(moderation)/enforcements/status"
    static let bannedUsers: TWEndpoint = "\(moderation)/banned"
    static let bannedEvents: TWEndpoint = "\(bannedUsers)/events"
    /// Channels
    static let channels = "\(helix)/channels"
    static let startCommercial = "\(channels)/commercial"
    /// Analytics
    static let analytics = "\(helix)/analytics"
    static let extensionAnalytics = "\(analytics)/extensions"
    /// Ingests
    static let ingests = "\(kraken)/ingests"
    /// Extensions
    static let extensions = "\(helix)/extensions/list"
    static let activeExtensions = "\(helix)/extensions"
    static let extensionTransations = "\(extensions)/transactions"
    /// Moderators
    static let moderators = "\(helix)/moderators"
    static let moderatorEvents = "\(moderators)/events"
    /// Entitlements
    static let entitlements = "\(helix)/entitlements"
    static let entitlementCodes = "\(entitlements)/codes"
    static let redeemCode = "\(entitlements)/code"
    /// Bits
    static let bits = "\(helix)/bits"
    static let cheermotes = "\(bits)/cheermotes"
    /// Clips
    static let clips = "\(helix)/clips"
    /// Subscriptions
    static let subscriptions = "\(helix)/subscriptions"
}

enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

typealias TWRequestBody<T: Codable> = TWContainer<T>

protocol TWRequest {
    var endpoint: TWEndpoint { get }
    var method: HTTPMethod { get }
    var params: [String: String] { get }
    var body: Encodable? { get }
}

struct TWUsersRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.users
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(id: String?, login: String?) {
        if let id = id {
            params["id"] = id
        }
        if let login = login {
            params["login"] = login
        }
    }
}

struct TWFollowsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.userFollows
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(after: String?, first: Int?, fromId: String?, toId: String?) {
        if let after = after {
            params["after"] = after
        }
        if let firstnum = first {
            params["first"] = String(firstnum)
        }
        if let fromId = fromId {
            params["from_id"] = fromId
        }
        if let toId = toId {
            params["to_id"] = toId
        }
    }
}

struct TWGamesRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.games
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(id: String?, title: String?) {
        if let id = id {
            params["id"] = id
        }
        if let title = title {
            params["title"] = title
        }
    }
}

struct TWStreamKeyRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamKey
    var method: HTTPMethod = .get
    var params: [String: String]
    var body: Encodable?
    init(_ broadcasterId: String) {
        params = ["broadcaster_id": broadcasterId]
    }
}

struct TWVideosRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.videos
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(id: String, userId: String, gameId: String) {
        params["id"] = id
        params["user_id"] = userId
        params["game_id"] = gameId
    }
}

struct TWModeratorsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.moderators
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(_ broadcasterId: String, userId: String?, after: String?) {
        params["broadcaster_id"] = broadcasterId
        if let userId = userId {
            params["user_id"] = userId
        }
        if let after = after {
            params["after"] = after
        }
    }
}

struct TWModeratorEventsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.moderatorEvents
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(_ broadcasterId: String, userId: String?) {
        params["broadcaster_id"] = broadcasterId
        if let userId = userId {
            params["user_id"] = userId
        }
    }
}

struct TWClipsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.clips
    var method: HTTPMethod = .get
    var params: [String: String]
    var body: Encodable?
    init(broadcasterId: String, gameId: String, id: String) {
        params = [
            "broadcaster_id": broadcasterId,
            "game_id": gameId,
            "id": id
        ]
    }
}

struct TWStreamsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streams
    var method: HTTPMethod = .get
    var headers: [String: String]?
    var params: [String: String] = [:]
    var body: Encodable?
    init(after: String?, before: String?, first: Int?, gameId: String?, language: String?, userId: String?, userLogin: String?) {
        if let after = after {
            params["after"] = after
        }
        if let before = before {
            params["before"] = before
        }
        if let firstNum = first {
            params["first"] = String(firstNum)
        }
        if let gameId = gameId {
            params["game_id"] = gameId
        }
        if let language = language {
            params["language"] = language
        }
        if let userId = userId {
            params["user_id"] = userId
        }
        if let userlogin = userLogin {
            params["user_login"] = userlogin
        }
    }
}

struct TWStreamTagsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamTags
    var method: HTTPMethod = .get
    var params: [String: String]
    var body: Encodable?
    init(_ broadcasterId: String) {
        params = ["broadcaster_id": broadcasterId]
    }
}

struct TWAllStreamTagsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.allTags
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(tagId: String?, after: String?, first: Int?) {
        if let tagId = tagId {
            params["tag_id"] = tagId
        }
        if let after = after {
            params["after"] = after
        }
        if let firstNum = first {
            params["first"] = String(firstNum)
        }
    }
}

struct TWExtensionsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.extensions
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
}

struct TWCodeStatusRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.entitlementCodes
    var method: HTTPMethod = .get
    var params: [String: String]
    var body: Encodable?
    init(code: String, userId: Int) {
        params = [
            "code": code,
            "user_id": String(userId)
        ]
    }
}

struct TWSearchCategoriesRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.searchCategories
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(_ query: String, first: Int?, after: String?) {
        params["query"] = query
        if let firstNum = first {
            params["first"] = String(firstNum)
        }
        if let after = after {
            params["after"] = after
        }
    }
}

struct TWSearchChannelsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.searchChannels
    var method: HTTPMethod = .get
    var params: [String : String] = [:]
    var body: Encodable?
    init(_ query: String, first: Int?, after: String?, liveOnly: Bool?) {
        params["query"] = query
        if let firstNum = first {
            params["first"] = String(firstNum)
        }
        if let after = after {
            params["after"] = after
        }
        // TODO: handle liveOnly
    }
}

struct TWTopGamesRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.topGames
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(after: String?, before: String?, first: Int?) {
        if let after = after {
            params["after"] = after
        }
        if let before = before {
            params["before"] = before
        }
        if let firstNum = first {
            params["first"] = String(firstNum)
        }
    }
}

struct TWBannedUsersRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.bannedUsers
    var method: HTTPMethod = .get
    var params: [String: String] = [:]
    var body: Encodable?
    init(_ broadcasterId: String, userId: String?, after: String?, before: String?) {
        params["broadcaster_id"] = broadcasterId
        if let after = after {
            params["after"] = after
        }
        if let before = before {
            params["before"] = before
        }
    }
}

struct TWCreateUserFollowsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.userFollows
    var method: HTTPMethod = .post
    var params: [String : String] = [:]
    var body: Encodable?
    init(fromId: String, toId: String, allowNotifications: Bool?) {
        
    }
}

struct TWCheckAutomodStatusRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.games
    var method: HTTPMethod = .post
    var params: [String: String] = [:]
    var body: Encodable?
    init(_ broadcasterId: String, messages: [TWMessage]) {
        body = TWContainer(messages)
    }
}

struct TWCreateStreamMarker: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamMarker
    var method: HTTPMethod = .post
    var params: [String : String] = [:]
    var body: Encodable?
    init(_ userId: String, description: String?) {
        body = TWContainer(["user_id": userId, "description": description])
    }
}

struct TWChannelInfoRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.channels
    var method: HTTPMethod = .get
    var params: [String: String]
    var body: Encodable?
    init(_ broadcasterId: String) {
        params = ["broadcaster_id": broadcasterId]
    }
}

struct TWCreateClipRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.clips
    var method: HTTPMethod = .post
    var params: [String : String] = [:]
    var body: Encodable?
    init(_ broadcastId: String, hasDelay: Bool?) {
        params["broadcast_id"] = broadcastId
//        if let hasDelay = hasDelay {
//            params["has_delay"] = hasDelay
//        }
    }
}

struct TWDeleteUserFollows: TWRequest {
    var endpoint: TWEndpoint = Endpoints.userFollows
    var method: HTTPMethod = .delete
    var params: [String : String]
    var body: Encodable?
    init(fromId: String, toId: String) {
        params = ["from_id": fromId, "to_id": toId]
    }
}

struct TWUpdateUserRequest: TWRequest {
    
    var endpoint: TWEndpoint = Endpoints.users
    var method: HTTPMethod = .put
    var params: [String : String] = [:]
    var body: Encodable?
    
    init(_ description: String?) {
        if let desc = description {
            params["description"] = desc
        }
    }
}

struct TWBroadcasterSubsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.subscriptions
    var method: HTTPMethod = .get
    var params: [String : String]
    var body: Encodable?
    
    init(_ broadcasterId: String, userId: String?) {
        params = ["broadcaster_id": broadcasterId]
        if let userId = userId {
            params["user_id"] = userId
        }
    }
}

struct TWReplaceStreamTagsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamTags
    var method: HTTPMethod = .put
    var params: [String : String]
    var body: Encodable?
    
    init(_ broadcasterId: String, tagIds: [String]?) {
        params = ["broadcaster_id": broadcasterId]
        if let tagIds = tagIds {
            body = tagIds
        }
    }
}

struct TWActiveExtensionsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.activeExtensions
    var method: HTTPMethod = .get
    var params: [String : String] = [:]
    var body: Encodable?
    
    init(userId: String?) {
        if let userId = userId {
            params["user_id"] = userId
        }
    }
}

struct TWModifyChannelInfoRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.channels
    var method: HTTPMethod = .patch
    var params: [String : String]
    var body: Encodable?
    init(_ broadcasterId: String, gameId: String?, broadcasterLanguage: String?, title: String?) {
        params = ["broadcaster_id": broadcasterId]
        if let gameId = gameId {
            params["game_id"] = gameId
        }
        if let language = broadcasterLanguage {
            params["broadcaster_language"] = language
        }
        if let title = title {
            params["title"] = title
        }
    }
}
