//
//  Twitch.swift
//
//  Created by Øyvind Hauge on 20/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public class Twitch: NSObject {
    
    /// Struct containing general configuration
    public static var config: TWConfig!
    
    /// Struct containing tokens
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
    private static let bitsRepository = TWBitsRepository()
    private static let analyticsRepository = TWAnalyticsRepository()
    private static let adsRepository = TWAdsRepository()
    private static let webhooksRepository = TWWebhooksRepository()
    
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
        public static func getUsers(id: [String]? = nil, login: [String]? = nil, result: @escaping TWContainerBlock<[TWUser]>) {
            usersRepository.getUsers(id: id, login: login, result: result)
        }
        
        /// Gets information on follow relationships between two Twitch users. Information returned is sorted in order, most recent follow first. This can return information like “who is qotrok following,” “who is following qotrok,” or “is user X following user Y.” The response has a JSON payload with a data field containing an array of follow relationship elements and a pagination field containing information required to query for more follow information.
        /// - Parameters:
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response. The cursor value specified here is from the pagination response field of a prior query.
        ///   - first: Maximum number of objects to return. Maximum: 100. Default: 20.
        ///   - fromId: User ID. The request returns information about users who are being followed by the from_id user.
        ///   - toId: User ID. The request returns information about users who are following the to_id user.
        ///   - result: Result block
        public static func getFollows(after: String? = nil, first: Int? = nil, fromId: String? = nil, toId: String? = nil, result: @escaping TWContainerBlock<[TWFollow]>) {
            usersRepository.getFollows(after: after, first: first, fromId: fromId, toId: toId, result: result)
        }
        
        /// Gets a list of all extensions (both active and inactive) for a specified user, identified by a Bearer token. The response has a JSON payload with a data field containing an array of user-information elements.
        /// - Parameter result: Result block
        public static func getExtensions(result: @escaping TWContainerBlock<[TWExtension]>) {
            usersRepository.getExtensions(result: result)
        }
        
        
        /// Gets information about active extensions installed by a specified user, identified by a user ID or Bearer token.
        /// - Parameters:
        ///   - userId: ID of the user whose installed extensions will be returned. Limit: 1.
        ///   - result: Result block
        func getActiveExtensions(userId: String? = nil, result: @escaping TWContainerBlock<[TWExtension]>) {
            usersRepository.getActiveExtensions(userId: userId, result: result)
        }
        
        /// Adds a specified user to the followers of a specified channel.
        /// - Parameters:
        ///   - fromId: User ID of the follower
        ///   - toId: ID of the channel to be followed by the user
        ///   - allowNotifications: If true, the user gets email or push notifications (depending on the user’s notification settings) when the channel goes live. Default value is false.
        ///   - result: Result block
        public static func createUserFollows(fromId: String, toId: String, allowNotifications: Bool? = nil, result: @escaping TWNoContentBlock) {
            usersRepository.createFollows(fromId: fromId, toId: toId, allowNotifications: allowNotifications, result: result)
        }
    }
}

// MARK: Twitch Games API

extension Twitch {
    
    public struct Games {
        
        /// Gets game information by game ID or name. The response has a JSON payload with a data field containing an array of games elements.
        /// - Parameters:
        ///   - id: Game ID. At most 100 id values can be specified.
        ///   - name: Game name. The name must be an exact match. For instance, “Pokemon” will not return a list of Pokemon games; instead, query the specific Pokemon game(s) in which you are interested. At most 100 name values can be specified.
        ///   - result: Result block
        public static func getGames(id: [String]? = nil, name: [String]? = nil, result: @escaping TWContainerBlock<[TWGame]>) {
            gamesRepository.getGames(id: id, name: name, result: result)
        }
        
        /// Gets games sorted by number of current viewers on Twitch, most popular first. The response has a JSON payload with a data field containing an array of games information elements and a pagination field containing information required to query for more streams.
        /// - Parameters:
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response. The cursor value specified here is from the pagination response field of a prior query.
        ///   - before: Cursor for backward pagination: tells the server where to start fetching the next set of results, in a multi-page response. The cursor value specified here is from the pagination response field of a prior query.
        ///   - first: Maximum number of objects to return. Maximum: 100. Default: 20.
        ///   - result: Result block
        public static func getTopGames(after: String? = nil, before: String? = nil, first: Int? = nil, result: @escaping TWContainerBlock<[TWGame]>) {
            gamesRepository.getTopGames(after: after, before: before, first: first, result: result)
        }
    }
}

// MARK: Twitch Videos API

extension Twitch {
    
    public struct Videos {
        
        /// Gets video information by video ID (one or more), user ID (one only), or game ID (one only). The response has a JSON payload with a data field containing an array of video elements. For lookup by user or game, pagination is available, along with several filters that can be specified as query parameters.
        /// - Parameters:
        ///   - id: ID of the video being queried. Limit: 100. If this is specified, you cannot use any of the optional query parameters below.
        ///   - userId: ID of the user who owns the video. Limit 1.
        ///   - gameId: ID of the game the video is of. Limit 1.
        ///   - result: Result block
        public static func getVideos(id: [String], userId: String, gameId: String, after: String?, before: String?,
        first: String?, language: String?, period: String?, sort: String?, type: String?, result: @escaping TWContainerBlock<[TWVideo]>) {
            videosRepository.getVideos(id: id, userId: userId, gameId: gameId, after: after, before: before, first: first, language: language, period: period, sort: sort, type: type, result: result)
        }
    }
}

// MARK: Twitch Clips API

extension Twitch {
    
    public struct Clips {
        
        /// Gets clip information by clip ID (one or more), broadcaster ID (one only), or game ID (one only). The response has a JSON payload with a data field containing an array of clip information elements and a pagination field containing information required to query for more streams.
        /// - Parameters:
        ///   - broadcasterId: ID of the broadcaster for whom clips are returned. The number of clips returned is determined by the first query-string parameter (default: 20). Results are ordered by view count.
        ///   - gameId: ID of the game for which clips are returned. The number of clips returned is determined by the first query-string parameter (default: 20). Results are ordered by view count.
        ///   - id: ID of the clip being queried. Limit: 100.
        ///   - result: Result block
        public static func getClips(broadcasterId: String?, gameId: String?, id: [String]?, result: @escaping TWContainerBlock<[TWClip]>) {
            clipsRepository.getClips(broadcasterId: broadcasterId, gameId: gameId, id: id, result: result)
        }
        
        /// Creates a clip programmatically. This returns both an ID and an edit URL for the new clip. Clip creation takes time. We recommend that you query Get Clips, with the clip ID that is returned here. If Get Clips returns a valid clip, your clip creation was successful. If, after 15 seconds, you still have not gotten back a valid clip from Get Clips, assume that the clip was not created and retry Create Clip. This endpoint has a global rate limit, across all callers. The limit may change over time, but the response includes informative headers:
        /// - Parameters:
        ///   - broadcasterId: ID of the stream from which the clip will be made.
        ///   - hasDelay: If false, the clip is captured from the live stream when the API is called; otherwise, a delay is added before the clip is captured (to account for the brief delay between the broadcaster’s stream and the viewer’s experience of that stream). Default: false.
        ///   - result: Result block
        public static func createClip(broadcasterId: String, hasDelay: Bool?, result: @escaping TWContainerBlock<[TWClipInfo]>) {
            clipsRepository.createClip(broadcasterId: broadcasterId, hasDelay: hasDelay, result: result)
        }
    }
}

// MARK: Twitch Stream API

extension Twitch {
    
    public struct Streams {
        
        /// Gets the channel stream key for a user.
        /// - Parameters:
        ///   - broadcasterId: User ID of the broadcaster
        ///   - result: Result block
        public static func getStreamKey(broadcasterId: String, result: @escaping TWContainerBlock<[TWStreamKey]>) {
            streamsRepository.getStreamKey(broadcasterId: broadcasterId, result: result)
        }
        
        /// Gets information about active streams. Streams are returned sorted by number of current viewers, in descending order. Across multiple pages of results, there may be duplicate or missing streams, as viewers join and leave streams. The response has a JSON payload with a data field containing an array of stream information elements and a pagination field containing information required to query for more streams.
        /// - Parameters:
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response. The cursor value specified here is from the pagination response field of a prior query.
        ///   - before: Cursor for backward pagination: tells the server where to start fetching the next set of results, in a multi-page response. The cursor value specified here is from the pagination response field of a prior query.
        ///   - first: Maximum number of objects to return. Maximum: 100. Default: 20.
        ///   - gameId: Returns streams broadcasting a specified game ID. You can specify up to 100 IDs.
        ///   - language: Stream language. You can specify up to 100 languages.
        ///   - userId: Returns streams broadcast by one or more specified user IDs. You can specify up to 100 IDs.
        ///   - userLogin: Returns streams broadcast by one or more specified user login names. You can specify up to 100 names.
        ///   - result: Result block
        public static func getStreams(after: String? = nil, before: String? = nil,
                               first: Int? = nil, gameId: String? = nil, language: String? = nil,
                               userId: String? = nil, userLogin: String? = nil, result: @escaping TWContainerBlock<[TWStream]>) {
            streamsRepository.getStreams(after: after, before: before, first: first, gameId: gameId, language: language, userId: userId, userLogin: userLogin, result: result)
        }
        
        /// Gets the list of tags for a specified stream (channel). The response has a JSON payload with a data field containing an array of tag elements.
        /// - Parameters:
        ///   - broadcasterId: ID of the stream thats tags are going to be fetched
        ///   - result: Result block
        public static func getStreamTags(broadcasterId: String, result: @escaping TWContainerBlock<[TWStreamTag]>) {
            streamsRepository.getStreamTags(broadcasterId: broadcasterId, result: result)
        }
        
        /// Applies specified tags to a specified stream, overwriting any existing tags applied to that stream. If no tags are specified, all tags previously applied to the stream are removed. Automated tags are not affected by this operation. Tags expire 72 hours after they are applied, unless the stream is live within that time period. If the stream is live within the 72-hour window, the 72-hour clock restarts when the stream goes offline. The expiration period is subject to change.
        /// - Parameters:
        ///   - broadcasterId: ID of the stream for which tags are to be replaced.
        ///   - tagIds: IDs of tags to be applied to the stream. Maximum of 100 supported.
        ///   - result: Result block
        public static func replaceStreamTags(broadcasterId: String, tagIds: [String]? = nil, result: @escaping TWNoContentBlock) {
            streamsRepository.replaceStreamTags(broadcasterId: broadcasterId, tagIds: tagIds, result: result)
        }
        
        
        /// Creates a marker in the stream of a user specified by a user ID. A marker is an arbitrary point in a stream that the broadcaster wants to mark; e.g., to easily return to later. The marker is created at the current timestamp in the live broadcast when the request is processed. Markers can be created by the stream owner or editors. The user creating the marker is identified by a Bearer token.
        /// - Parameters:
        ///   - userId: ID of the broadcaster in whose live stream the marker is created.
        ///   - description: Description of or comments on the marker. Max length is 140 characters.
        ///   - result: Result block
        public static func createStreamMarker(userId: String, description: String? = nil, result: @escaping TWContainerBlock<TWStreamMarker>) {
            streamsRepository.createStreamMarker(userId: userId, description: description, result: result)
        }
        
        /// Gets channel information for users.
        /// - Parameters:
        ///   - broadcatserId: ID of the channel to be updated
        ///   - result: Result block
        public static func getChannelInfo(broadcatserId: String, result: @escaping TWContainerBlock<[TWChannelInfo]>) {
            streamsRepository.getChannelInfo(broadcatserId: broadcatserId, result: result)
        }
        
        /// Modifies channel information for users.
        /// - Parameters:
        ///   - broadcasterId: ID of the channel to be updated
        ///   - gameId: The current game ID being played on the channel
        ///   - broadcasterLanguage: The language of the channel
        ///   - title: The title of the stream
        ///   - result: Result block
        public static func modifyChannelInfo(broadcasterId: String, gameId: String? = nil, broadcasterLanguage: String? = nil, title: String? = nil, result: @escaping TWNoContentBlock) {
            streamsRepository.modifyChannelInfo(broadcasterId: broadcasterId, gameId: gameId,
                                                broadcasterLanguage: broadcasterLanguage, title: title, result: result)
        }
    }
}

// MARK: Twitch Moderation API

extension Twitch {
    
    public struct Moderation {
        
        /// Returns all moderators in a channel.
        /// - Parameters:
        ///   - broadcasterId: Provided broadcaster_id must match the user_id in the auth token. Maximum: 1
        ///   - userId: Filters the results and only returns a status object for users who are banned in this channel and have a matching user_id.
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results in a multi-page response. This applies only to queries without user_id. If a user_id is specified, it supersedes any cursor/offset combinations. The cursor value specified here is from the pagination response field of a prior query.
        ///   - result: Result block
        public static func getModerators(broadcasterId: String, userId: [String]? = nil, after: String? = nil, result: @escaping TWContainerBlock<[TWModerator]>) {
            moderationRepository.getModerators(broadcasterId: broadcasterId, userId: userId, after: after, result: result)
        }
        
        /// Returns a list of moderators or users added and removed as moderators from a channel.
        /// - Parameters:
        ///   - broadcasterId: Provided broadcaster_id must match the user_id in the auth token. Maximum: 1
        ///   - userId: Filters the results and only returns a status object for users who are banned in this channel and have a matching user_id.
        ///   - result: Result block
        public static func getModeratorEvents(broadcasterId: String, userId: [String]? = nil, result: @escaping TWContainerBlock<[TWModeratorEvent]>) {
            moderationRepository.getModeratorEvents(broadcasterId: broadcasterId, userId: userId, result: result)
        }
        
        /// Returns all banned and timed-out users in a channel.
        /// - Parameters:
        ///   - broadcasterId: Provided broadcaster_id must match the user_id in the auth token. Maximum: 1
        ///   - userId: Filters the results and only returns a status object for users who are banned in this channel and have a matching user_id.
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results in a multi-page response. This applies only to queries without user_id. If a user_id is specified, it supersedes any cursor/offset combinations. The cursor value specified here is from the pagination response field of a prior query.
        ///   - before: Cursor for backward pagination: tells the server where to start fetching the next set of results in a multi-page response. This applies only to queries without user_id. If a user_id is specified, it supersedes any cursor/offset. combinations. The cursor value specified here is from the pagination response field of a prior query.
        ///   - result: Result block
        public static func getBannedUsers(broadcasterId: String, userId: [String]? = nil, after: String? = nil, before: String? = nil, result: @escaping TWContainerBlock<[TWBannedUser]>) {
            moderationRepository.getBannedUsers(broadcasterId: broadcasterId, userId: userId, after: after, before: before, result: result)
        }
        
        /// Returns all user bans and un-bans in a channel.
        /// - Parameters:
        ///   - broadcasterId: Provided broadcaster_id must match the user_id in the auth token. Maximum: 1
        ///   - userId: Filters the results and only returns a status object for users who are banned in this channel and have a matching user_id.
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results in a multi-page response. This applies only to queries without user_id. If a user_id is specified, it supersedes any cursor/offset combinations. The cursor value specified here is from the pagination response field of a prior query.
        ///   - first: Maximum number of objects to return. Maximum: 100. Default: 20.
        ///   - result: Result block
        public static func getBannedEvents(broadcasterId: String, userId: [String]?, after: String?, first: Int?, result: @escaping TWContainerBlock<[TWModeratorEvent]>) {
            moderationRepository.getBannedEvents(broadcasterId: broadcasterId, userId: userId, after: after, first: first, result: result)
        }
        
        /// Determines whether a string message meets the channel’s AutoMod requirements. AutoMod is a moderation tool that blocks inappropriate or harassing chat with powerful moderator control. AutoMod detects misspellings and evasive language automatically. AutoMod uses machine learning and natural language processing algorithms to hold risky messages from chat so they can be reviewed by a channel moderator before appearing to other viewers in the chat. Moderators can approve or deny any message caught by AutoMod. For more information about AutoMod, see: https://help.twitch.tv/s/article/how-to-use-automod?language=en_US
        /// - Parameters:
        ///   - broadcasterId: Provided broadcaster_id must match the user_id in the auth token.
        ///   - messages: The messages to be checked
        ///   - result: Result block
        public static func checkAutomodStatus(broadcasterId: String, messages: [TWMessage], result: @escaping TWContainerBlock<[TWMessageStatus]>) {
            moderationRepository.checkAutomodStatus(broadcasterId: broadcasterId, messages: messages, result: result)
        }
    }
}

// MARK: Twitch Entitlements API

extension Twitch {
    
    public struct Entitlements {
        
        /// Gets the status of one or more provided codes. This API requires that the caller is an authenticated Twitch user. The API is throttled to one request per second per authenticated user.
        /// - Parameters:
        ///   - code: The code to get the status of. Repeat this query parameter additional times to get the status of multiple codes. Ex: ?code=code1&code=code2 1-20 code parameters are allowed.
        ///   - userId: Represents a numeric Twitch user ID. The user account which is going to receive the entitlement associated with the code.
        ///   - result: Result block
        public static func getCodeStatus(code: [String], userId: String, result: @escaping TWContainerBlock<[TWCodeStatus]>) {
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
        public static func getBroadcasterSubscriptions(broadcasterId: String, userId: [String]? = nil, result: @escaping TWContainerBlock<[TWSubscription]>) {
            subsRepository.getBroadcasterSubscriptions(broadcasterId: broadcasterId, userId: userId, result: result)
        }
    }
}

// MARK: Twitch Bits API

extension Twitch {
    
    public struct Bits {
        
        /// Retrieves the list of available Cheermotes, animated emotes to which viewers can assign Bits, to cheer in chat. Cheermotes returned are available throughout Twitch, in all Bits-enabled channels.
        /// - Parameters:
        ///   - broadcasterId: ID for the broadcaster who might own specialized Cheermotes.
        ///   - result: Result block
        public static func getCheermotes(broadcasterId: String?, result: @escaping TWContainerBlock<[TWCheermoteContainer]>) {
            bitsRepository.getCheermotes(broadcasterId: broadcasterId, result: result)
        }
    }
}

// MARK: Twitch Analytics API

extension Twitch {
    
    public struct Analytics {
        
        /// Gets a URL that game developers can use to download analytics reports (CSV files) for their games. The URL is valid for 5 minutes. The response has a JSON payload with a data field containing an array of games information elements and can contain a pagination field containing information required to query for more streams. If you specify a future date, the response will be “Report Not Found For Date Range.” If you leave both started_at and ended_at blank, the API returns the most recent date of data.
        /// - Parameters:
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response. This applies only to queries without game_id. If a game_id is specified, it supersedes any cursor/offset combinations. The cursor value specified here is from the pagination response field of a prior query.
        ///   - startedAt: Starting date/time for returned reports, in RFC3339 format with the hours, minutes, and seconds zeroed out and the UTC timezone: YYYY-MM-DDT00:00:00Z. If this is provided, ended_at also must be specified. If started_at is earlier than the default start date, the default date is used. Default: 365 days (overview_v2) or 90 days (overview_v1) before the report was issued. The file contains one row of data per day.
        ///   - endedAt:     Ending date/time for returned reports, in RFC3339 format with the hours, minutes, and seconds zeroed out and the UTC timezone: YYYY-MM-DDT00:00:00Z. The report covers the entire ending date; e.g., if 2018-05-01T00:00:00Z is specified, the report covers up to 2018-05-01T23:59:59Z. If this is provided, started_at also must be specified. If ended_at is later than the default end date, the default date is used. Default: 1-2 days before the request was issued (depending on report availability).
        ///   - first: Maximum number of objects to return. Maximum: 100. Default: 20.
        ///   - gameId: Game ID. If this is specified, the returned URL points to an analytics report for just the specified game. If this is not specified, the response includes multiple URLs (paginated), pointing to separate analytics reports for each of the authenticated user’s games.
        ///   - type: Type of analytics report that is returned. If this is specified, the response includes one URL, for the specified report type. If this is not specified, the response includes multiple URLs (paginated), one for each report type available for the authenticated user’s games. Limit: 1. Valid values: "overview_v1", "overview_v2". Default: all report types for the authenticated user’s games.
        ///   - result: Result block
        public static func getGameAnalytics(after: String?, startedAt: String?, endedAt: String?, first: Int?,
                                            gameId: String?, type: String?, result: @escaping TWContainerBlock<[TWGameAnalytics]>) {
            analyticsRepository.getGameAnalytics(after: after, startedAt: startedAt, endedAt: endedAt, first: first, gameId: gameId, type: type, result: result)
        }
    }
}

// MARK: Twitch Ads API

extension Twitch {
    
    public struct Ads {
        
        /// Starts a commercial on a specified channel.
        /// - Parameters:
        ///   - broadcasterId: ID of the channel requesting a commercial. Minimum: 1 Maximum: 1
        ///   - length: Desired length of the commercial in seconds. Valid options are 30, 60, 90, 120, 150, 180.
        ///   - result: Result block
        public static func startCommercial(broadcasterId: String, length: Int, result: @escaping TWContainerBlock<[TWCommercial]>) {
            adsRepository.startCommercial(broadcasterId: broadcasterId, length: length, result: result)
        }
    }
}

// MARK: Twitch Webhooks API

extension Twitch {
    
    public struct Webhooks {
        
        /// Gets the Webhook subscriptions of a user identified by a Bearer token, in order of expiration. The response has a JSON payload with a data field containing an array of subscription elements and a pagination field containing information required to query for more subscriptions.
        /// - Parameters:
        ///   - after: Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response. The cursor value specified here is from the pagination response field of a prior query.
        ///   - first: Number of values to be returned per page. Limit: 100. Default: 20.
        ///   - result: Result block
        public static func getSubscriptions(after: String?, first: String?, result: @escaping TWContainerBlock<[TWWebhookSub]>) {
            webhooksRepository.getSubscriptions(after: after, first: first, result: result)
        }
    }
}
