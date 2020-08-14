//
//  TwitchAPI.swift
//  Twitch
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public enum TWEntityResult<T: Codable> {
    case success(T)
    case failure(Error)
}

public enum TWNoContentResult {
    case success
    case failure(Error)
}

public typealias TWContainerBlock<T: Codable> = (TWEntityResult<TWContainer<T>>) -> Void
public typealias TWNoContentBlock = (TWNoContentResult) -> Void

// #######################
// ##   NEW/HELIX API   ##
// #######################

// MARK: Users API

protocol TWUsersAPI {
    func getUsers(id: [String]?, login: [String]?, result: @escaping TWContainerBlock<[TWUser]>)
    func getFollows(after: String?, first: Int?, fromId: String?, toId: String?, result: @escaping TWContainerBlock<[TWFollow]>)
    func getExtensions(result: @escaping TWContainerBlock<[TWExtension]>)
    func getActiveExtensions(userId: String?, result: @escaping TWContainerBlock<[TWExtension]>)
    func createFollows(fromId: String, toId: String, allowNotifications: Bool?, result: @escaping TWNoContentBlock)
    func deleteFollows(fromId: String, toId: String, result: @escaping TWNoContentBlock)
    func updateUser(description: String?, result: @escaping TWContainerBlock<[TWUser]>)
}

// MARK: Games API

protocol TWGamesAPI {
    func getGames(id: [String]?, name: [String]?, result: @escaping TWContainerBlock<[TWGame]>)
    func getTopGames(after: String?, before: String?, first: Int?, result: @escaping TWContainerBlock<[TWGame]>)
}

// MARK: Streams API

protocol TWStreamsAPI {
    func getStreamKey(broadcasterId: String, result: @escaping TWContainerBlock<[TWStreamKey]>)
    func getStreams(after: String?, before: String?, first: Int?, gameId: String?,
                    language: String?, userId: String?, userLogin: String?, result: @escaping TWContainerBlock<[TWStream]>)
    func getStreamTags(broadcasterId: String, result: @escaping TWContainerBlock<[TWStreamTag]>)
    func replaceStreamTags(broadcasterId: String, tagIds: [String]?, result: @escaping TWNoContentBlock)
    func createStreamMarker(userId: String, description: String?, result: @escaping TWContainerBlock<TWStreamMarker>)
    func getChannelInfo(broadcatserId: String, result: @escaping TWContainerBlock<[TWChannelInfo]>)
    func modifyChannelInfo(broadcasterId: String, gameId: String?, broadcasterLanguage: String?, title: String?, result: @escaping TWNoContentBlock)
    func getStreamMarkers(userId: String?, videoId: String?, after: String?, before: String?, first: String?, result: @escaping TWContainerBlock<[TWStreamMarkerContainer]>)
}

// MARK: Bits API

protocol TWBitsAPI {
    func getCheermotes(broadcasterId: String?, result: @escaping TWContainerBlock<[TWCheermoteContainer]>)
    func getLeaderboard(count: Int?, period: String?, startedAt: String?, userId: String?, result: @escaping TWContainerBlock<[TWLeaderboard]>)
}

// MARK: Subs API

protocol TWSubsAPI {
    func getBroadcasterSubscriptions(broadcasterId: String, userId: [String]?, result: @escaping TWContainerBlock<[TWSubscription]>)
}

// MARK: Clips API

protocol TWClipsAPI {
    func getClips(broadcasterId: String?, gameId: String?, id: [String]?, result: @escaping TWContainerBlock<[TWClip]>)
    func createClip(broadcasterId: String, hasDelay: Bool?, result: @escaping TWContainerBlock<[TWClipInfo]>)
}

// MARK: Videos API

protocol TWVideosAPI {
    func getVideos(id: [String], userId: String, gameId: String, after: String?, before: String?,
    first: String?, language: String?, period: String?, sort: String?, type: String?, result: @escaping TWContainerBlock<[TWVideo]>)
}

// MARK: Moderation API

protocol TWModerationAPI {
    func getModerators(broadcasterId: String, userId: [String]?, after: String?, result: @escaping TWContainerBlock<[TWModerator]>)
    func getModeratorEvents(broadcasterId: String, userId: [String]?, result: @escaping TWContainerBlock<[TWModeratorEvent]>)
    func getBannedUsers(broadcasterId: String, userId: [String]?, after: String?, before: String?, result: @escaping TWContainerBlock<[TWBannedUser]>)
    func getBannedEvents(broadcasterId: String, userId: [String]?, after: String?, first: Int?, result: @escaping TWContainerBlock<[TWModeratorEvent]>)
    func checkAutomodStatus(broadcasterId: String, messages: [TWMessage], result: @escaping TWContainerBlock<[TWMessageStatus]>)
}

// MARK: Analytics API

protocol TWAnalyticsAPI {
    func getGameAnalytics(after: String?, startedAt: String?,
                          endedAt: String?, first: Int?,
                          gameId: String?, type: String?, result: @escaping TWContainerBlock<[TWGameAnalytics]>)
}

// MARK: Entitlements API

protocol TWEntitlementsAPI {
    func getCodeStatus(code: [String], userId: String, result: @escaping TWContainerBlock<[TWCodeStatus]>)
    func redeemCode(code: [String], userId: String, result: @escaping TWContainerBlock<[TWCodeStatus]>)
}

// MARK: Tags API

protocol TWTagsAPI {
    func getAllTags(tagId: String?, after: String?, first: Int?, result: @escaping TWContainerBlock<[TWStreamTag]>)
}

// MARK: Search API

protocol TWSearchAPI {
    func searchCategories(query: String, first: Int?, after: String?, result: @escaping TWContainerBlock<[TWGame]>)
    func searchChannels(query: String, first: Int?, after: String?, liveOnly: Bool?, result: @escaping TWContainerBlock<[TWChannel]>)
}

// MARK: Ads API

protocol TWAdsAPI {
    func startCommercial(broadcasterId: String, length: Int, result: @escaping TWContainerBlock<[TWCommercial]>)
}

protocol TWWebhooksAPI {
    func getSubscriptions(after: String?, first: String?, result: @escaping TWContainerBlock<[TWWebhookSub]>)
}

// #######################
// ##   V5/KRAKEN API   ##
// #######################

protocol TWV5IngestsAPI {
    func getIngestServerList()
}

protocol TWV5ChatAPI {
    func getChatBadgesByChannel()
}
