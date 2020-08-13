//
//  TWRequest.swift
//  Twitch
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

struct TWParam {
    var name: String
    var value: String
    init(_ name: String, _ value: String) {
        self.name = name
        self.value = value
    }
}

protocol TWRequest {
    var endpoint: TWEndpoint { get }
    var method: HTTPMethod { get }
    var params: [TWParam] { get }
    var body: Encodable? { get }
}

struct TWUsersRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.users
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ id: [String]?, _ login: [String]?) {
        if let id = id {
            params.append(contentsOf: id.map { TWParam("id", $0) })
        }
        if let login = login {
            params.append(contentsOf: login.map { TWParam("login", $0) })
        }
    }
}

struct TWFollowsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.userFollows
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ after: String?, _ first: Int?, _ fromId: String?, _ toId: String?) {
        if let after = after {
            params.append(TWParam("after", after))
        }
        if let first = first {
            params.append(TWParam("first", String(first)))
        }
        if let toId = toId {
            params.append(TWParam("to_id", toId))
        }
    }
}

struct TWGamesRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.games
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ id: [String]?, _ name: [String]?) {
        if let id = id {
            params.append(contentsOf: id.map { TWParam("id", $0) })
        }
        if let name = name {
            params.append(contentsOf: name.map { TWParam("name", $0) })
        }
    }
}

struct TWStreamKeyRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamKey
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String) {
        params.append(TWParam("broadcaster_id", broadcasterId))
    }
}

struct TWVideosRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.videos
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ id: [String], _ userId: String, _ gameId: String, _ after: String?, _ before: String?,
         _ first: String?, _ language: String?, _ period: String?, _ sort: String?, _ type: String?) {
        params.append(contentsOf: id.map { TWParam("id", $0) })
        params.append(TWParam("user_id", userId))
        params.append(TWParam("game_id", gameId))
        if let after = after {
            params.append(TWParam("after", after))
        }
        if let before = before {
            params.append(TWParam("before", before))
        }
        if let first = first {
            params.append(TWParam("first", first))
        }
        if let language = language {
            params.append(TWParam("language", language))
        }
        if let period = period {
            params.append(TWParam("period", period))
        }
        if let sort = sort {
            params.append(TWParam("sort", sort))
        }
        if let type = type {
            params.append(TWParam("type", type))
        }
    }
}

struct TWModeratorsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.moderators
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ userId: [String]?, _ after: String?) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        if let userId = userId {
            params.append(contentsOf: userId.map { TWParam("user_id", $0) })
        }
        if let after = after {
            params.append(TWParam("after", after))
        }
    }
}

struct TWModeratorEventsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.moderatorEvents
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ userId: [String]?) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        if let userId = userId {
            params.append(contentsOf: userId.map { TWParam("user_id", $0) })
        }
    }
}

struct TWClipsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.clips
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String?, _ gameId: String?, _ id: [String]?) {
    }
}

struct TWStreamsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streams
    var method: HTTPMethod = .get
    var headers: [String: String]?
    var params: [TWParam] = []
    var body: Encodable?
    init(_ after: String?, _ before: String?, _ first: Int?, _ gameId: String?, _ language: String?, _ userId: String?, _ userLogin: String?) {
    }
}

struct TWStreamTagsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamTags
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String) {
        params.append(TWParam("broadcaster_id", broadcasterId))
    }
}

struct TWAllStreamTagsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.allTags
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ tagId: String?, _ after: String?, _ first: Int?) {
    }
}

struct TWExtensionsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.userExtensions
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
}

struct TWCodeStatusRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.entitlementCodes
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ code: [String], _ userId: String) {
        params.append(contentsOf: code.map { TWParam("code", $0) })
        params.append(TWParam("user_id", userId))
    }
}

struct TWSearchCategoriesRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.searchCategories
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ query: String, _ first: Int?, _ after: String?) {
    }
}

struct TWSearchChannelsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.searchChannels
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ query: String, _ first: Int?, _ after: String?, _ liveOnly: Bool?) {
    }
}

struct TWTopGamesRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.topGames
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ after: String?, _ before: String?, _ first: Int?) {
    }
}

struct TWBannedUsersRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.bannedUsers
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ userId: [String]?, _ after: String?, _ before: String?) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        if let userId = userId {
            params.append(contentsOf: userId.map { TWParam("user_id", $0) })
        }
        if let after = after {
            params.append(TWParam("after", after))
        }
        if let before = before {
            params.append(TWParam("before", before))
        }
    }
}

struct TWCreateUserFollowsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.userFollows
    var method: HTTPMethod = .post
    var params: [TWParam] = []
    var body: Encodable?
    init(_ fromId: String, _ toId: String, _ allowNotifications: Bool?) {
    }
}

struct TWCheckAutomodStatusRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.checkAutomodStatus
    var method: HTTPMethod = .post
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ messages: [TWMessage]) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        body = TWContainer(messages)
    }
}

struct TWCreateStreamMarker: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamMarker
    var method: HTTPMethod = .post
    var params: [TWParam] = []
    var body: Encodable?
    init(_ userId: String, _ description: String?) {
        body = TWContainer(["user_id": userId, "description": description])
    }
}

struct TWChannelInfoRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.channels
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String) {
        params.append(TWParam("broadcaster_id", broadcasterId))
    }
}

struct TWCreateClipRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.clips
    var method: HTTPMethod = .post
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ hasDelay: Bool?) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        if let hasDelay = hasDelay {
            params.append(TWParam("has_delay", String(hasDelay)))
        }
    }
}

struct TWDeleteUserFollows: TWRequest {
    var endpoint: TWEndpoint = Endpoints.userFollows
    var method: HTTPMethod = .delete
    var params: [TWParam] = []
    var body: Encodable?
    init(_ fromId: String, _ toId: String) {
        params.append(TWParam("from_id", fromId))
        params.append(TWParam("to_id", toId))
    }
}

struct TWUpdateUserRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.users
    var method: HTTPMethod = .put
    var params: [TWParam] = []
    var body: Encodable?
    init(_ description: String?) {
        if let description = description {
            params.append(TWParam("description", description))
        }
    }
}

struct TWBroadcasterSubsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.subscriptions
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ userId: [String]?) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        if let userId = userId {
            params.append(contentsOf: userId.map { TWParam("user_id", $0) })
        }
    }
}

struct TWReplaceStreamTagsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamTags
    var method: HTTPMethod = .put
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ tagIds: [String]?) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        if let tagIds = tagIds {
            body = ["tag_ids": tagIds]
        }
    }
}

struct TWActiveExtensionsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.activeExtensions
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ userId: String?) {
        if let userId = userId {
            params.append(TWParam("user_id", userId))
        }
    }
}

struct TWModifyChannelInfoRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.channels
    var method: HTTPMethod = .patch
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ gameId: String?, _ broadcasterLanguage: String?, _ title: String?) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        if let gameId = gameId {
            params.append(TWParam("game_id", gameId))
        }
        if let broadcasterLanguage = broadcasterLanguage {
            params.append(TWParam("broadcaster_language", broadcasterLanguage))
        }
        if let title = title {
            params.append(TWParam("title", title))
        }
    }
}

struct TWOAuthRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.oauth
    var method: HTTPMethod = .get
    var params: [TWParam] = [
        TWParam("client_id", Twitch.credentials.clientId),
        TWParam("response_type", "token"),
        TWParam("redirect_uri", Twitch.config.redirectUri),
        TWParam("scope", Twitch.config.urlEncodedScopes),
        TWParam("force_verify", "false"),
        TWParam("state", "QjgX565URhyvAXn9")
    ]
    var body: Encodable?
}

struct TWCheermotesRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.cheermotes
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String?) {
        if let broadcasterId = broadcasterId {
            params.append(TWParam("broadcaster_id", broadcasterId))
        }
    }
}

struct TWLeaderboardRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.leaderboard
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    
    init(_ count: Int?, _ period: String?, _ startedAt: String?, _ userId: String?) {
        if let count = count {
            params.append(TWParam("count", String(count)))
        }
        if let period = period {
            params.append(TWParam("period", period))
        }
        if let startedAt = startedAt {
            params.append(TWParam("started_at", startedAt))
        }
        if let userId = userId {
            params.append(TWParam("user_id", userId))
        }
    }
}

struct TWGameAnalyticsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.gameAnalytics
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ after: String?, _ first: Int?, _ startedAt: String?, _ endedAt: String?, _ gameId: String?, _ type: String?) {
        if let after = after {
            params.append(TWParam("after", after))
        }
        if let first = first {
            params.append(TWParam("first", String(first)))
        }
        if let startedAt = startedAt {
            params.append(TWParam("started_at", startedAt))
        }
        if let endedAt = endedAt {
            params.append(TWParam("ended_at", endedAt))
        }
        if let gameId = gameId {
            params.append(TWParam("game_id", gameId))
        }
        if let type = type {
            params.append(TWParam("type", type))
        }
    }
}

struct TWStartCommercialRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.startCommercial
    var method: HTTPMethod = .post
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ length: Int) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        params.append(TWParam("length", String(length)))
    }
}

struct TWRedeemCodeRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.redeemCode
    var method: HTTPMethod = .post
    var params: [TWParam] = []
    var body: Encodable?
    init(_ code: [String], _ userId: String) {
        params.append(contentsOf: code.map { TWParam("code", $0) })
        params.append(TWParam("user_id", userId))
    }
}

struct TWBannedEventsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.bannedEvents
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ userId: [String]?, _ after: String?, _ first: Int?) {
        params.append(TWParam("broadcaster_id", broadcasterId))
        if let userId = userId {
            params.append(contentsOf: userId.map { TWParam("user_id", $0) })
        }
        if let after = after {
            params.append(TWParam("after", after))
        }
        if let first = first {
            params.append(TWParam("first", String(first)))
        }
    }
}
