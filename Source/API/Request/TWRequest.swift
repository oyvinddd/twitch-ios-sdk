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
    }
}

struct TWGamesRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.games
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ id: String?, _ name: String?) {
    }
}

struct TWStreamKeyRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamKey
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String) {
    }
}

struct TWVideosRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.videos
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ id: String, _ userId: String, _ gameId: String) {
    }
}

struct TWModeratorsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.moderators
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ userId: [String]?, _ after: String?) {
    }
}

struct TWModeratorEventsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.moderatorEvents
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ userId: String?) {
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
    init(_ code: String, _ userId: Int) {
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
    init(_ broadcasterId: String, _ userId: String?, _ after: String?, _ before: String?) {
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
    var endpoint: TWEndpoint = Endpoints.games
    var method: HTTPMethod = .post
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ messages: [TWMessage]) {
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
    }
}

struct TWCreateClipRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.clips
    var method: HTTPMethod = .post
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcastId: String, _ hasDelay: Bool?) {
    }
}

struct TWDeleteUserFollows: TWRequest {
    var endpoint: TWEndpoint = Endpoints.userFollows
    var method: HTTPMethod = .delete
    var params: [TWParam] = []
    var body: Encodable?
    init(_ fromId: String, _ toId: String) {
    }
}

struct TWUpdateUserRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.users
    var method: HTTPMethod = .put
    var params: [TWParam] = []
    var body: Encodable?
    init(_ description: String?) {
    }
}

struct TWBroadcasterSubsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.subscriptions
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ userId: String?) {
    }
}

struct TWReplaceStreamTagsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.streamTags
    var method: HTTPMethod = .put
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ tagIds: [String]?) {
    }
}

struct TWActiveExtensionsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.activeExtensions
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ userId: String?) {
    }
}

struct TWModifyChannelInfoRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.channels
    var method: HTTPMethod = .patch
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String, _ gameId: String?, _ broadcasterLanguage: String?, _ title: String?) {
    }
}

struct TWOAuthRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.oauth
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init() {
        params = [
            "client_id": Twitch.credentials.clientId,
            "response_type": "token",
            "redirect_uri": Twitch.config.redirectUri,
            "scope": Twitch.config.urlEncodedScopes,
            // optional params:
            "force_verify": "false",
            "state": "QjgX565URhyvAXn9"
        ]
    }
}

struct TWCheermotesRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.cheermotes
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ broadcasterId: String?) {
    }
}

struct TWLeaderboardRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.leaderboard
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    
    init(_ count: Int?, _ period: String?, _ startedAt: String?, _ userId: String?) {
    }
}

struct TWGameAnalyticsRequest: TWRequest {
    var endpoint: TWEndpoint = Endpoints.gameAnalytics
    var method: HTTPMethod = .get
    var params: [TWParam] = []
    var body: Encodable?
    init(_ after: String?, _ first: Int?, _ startedAt: String?, _ endedAt: String?, _ gameId: String?, _ type: String?) {
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

func aa(_ key: String, value: Any, params: inout [TWParam]) {
    if type(of: value) == String.self {
        
    }
}
