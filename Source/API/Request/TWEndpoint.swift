//
//  TWEndpoint.swift
//  Twitch
//
//  Created by Øyvind Hauge on 12/08/2020.
//

import Foundation

enum TWEndpointt: String {
    case startCommerical = "/helix/channels/commercial"
    case redeemCode = "/helix/entitlements/code"
}

// MARK: All API Endpoints (including V5 ones)
typealias TWEndpoint = String

struct Endpoints {
    /// New API
    fileprivate static let helix: TWEndpoint = "/helix"
    /// Old V5 API
    fileprivate static let kraken: TWEndpoint = "/kraken"
    /// Login
    static let oauth: TWEndpoint = "/oauth2/authorize"
    /// Users
    static let users: TWEndpoint = "\(helix)/users"
    static let userFollows: TWEndpoint = "\(users)/follows"
    static let userExtensions: TWEndpoint = "\(users)/extensions/list"
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
    static let gameAnalytics = "\(helix)/games"
    static let extensionAnalytics = "\(analytics)/extensions"
    /// Ingests
    static let ingests = "\(kraken)/ingests"
    /// Extensions
    static let extensions = "\(helix)/extensions/list"
    static let activeExtensions = "\(helix)/extensions"
    static let extensionTransations = "\(extensions)/transactions"
    /// Moderators
    static let moderators = "\(helix)/moderation/moderators"
    static let moderatorEvents = "\(moderators)/events"
    /// Entitlements
    static let entitlements = "\(helix)/entitlements"
    static let entitlementCodes = "\(entitlements)/codes"
    static let redeemCode = "\(entitlements)/code"
    /// Bits
    static let bits = "\(helix)/bits"
    static let cheermotes = "\(bits)/cheermotes"
    static let leaderboard = "\(helix)/leaderboard"
    /// Clips
    static let clips = "\(helix)/clips"
    /// Subscriptions
    static let subscriptions = "\(helix)/subscriptions"
    // Webhookds
    static let webhookSubs = "\(helix)/webhooks/subscriptions"
}
