//
//  TWConfig.swift
//  Screencast
//
//  Created by Øyvind Hauge on 21/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWConfig {
    var redirectUri: String
    var scopes: [TWScope]
    
    public init(redirectUri: String, scopes: [TWScope] = [TWConfig.Scope.openid]) {
        self.redirectUri = redirectUri
        self.scopes = scopes
    }
}

extension TWConfig {
    public typealias TWScope = String
    
    public struct Scope {
        /// Use OpenID Connect authentication.
        public static let openid: TWScope = "openid"
        /// Manage a user object.
        public static let userEdit: TWScope = "user:edit"
        /// Read authorized user’s stream key.
        public static let userReadStreamKey: TWScope = "user:read:stream_key"
        /// Read authorized user’s email address.
        public static let userReadEmail: TWScope = "user:read:email"
        /// View your broadcasting configuration, including extension configurations.
        public static let userReadBroadcast: TWScope = "user:read:broadcast"
        /// Edit your channel’s broadcast configuration, including extension configuration. (This scope implies user:read:broadcast capability.)
        public static let userEditBroadcast: TWScope = "user:edit:broadcast"
        /// Edit your follows.
        public static let userEditFollows: TWScope = "user:edit:follows"
        /// Manage a clip object
        public static let clipsEdit: TWScope = "clips:edit"
        /// View Bits information for your channel.
        public static let bitsRead: TWScope = "bits:read"
        /// Run commercials on a channel.
        public static let chanEditCommercial: TWScope = "channel:edit:commercial"
        /// ...
        public static let chanReadHypeTrain: TWScope = "channel:read:hype_train"
        /// Get a list of all subscribers to your channel and check if a user is subscribed to your channel
        public static let chanReadSubscriptions: TWScope = "channel:read:subscriptions"
        /// Read a user’s list of ignored users.
        public static let v5_userBlocksRead: TWScope = "user_blocks_read"
        /// Turn on/off ignoring a user. Ignoring users means you cannot see them type, receive messages from them, etc.
        public static let v5_userBlocksEdit: TWScope = "user_blocks_edit"
        /// Manage a user’s followed channels.
        public static let v5_userFollowsEdit: TWScope = "user_follows_edit"
        /// Read nonpublic user information, like email address.
        public static let v5_userRead: TWScope = "user_read"
        /// Read a user’s subscriptions.
        public static let v5userSubscriptions: TWScope = "user_subscriptions"
        /// Read whether a user is subscribed to your channel.
        public static let v5_chanCheckSubscription: TWScope = "channel_check_subscription"
        /// Trigger commercials on channel.
        public static let v5_chanCommercial: TWScope = "channel_commercial"
        /// Write channel metadata (game, status, etc).
        public static let v5_chanEditor: TWScope = "channel_editor"
        /// Add posts and reactions to a channel feed.
        public static let v5_chanFeedEdit: TWScope = "channel_feed_edit"
        /// Read all subscribers to your channel.
        public static let v5_chanSubscriptions: TWScope = "channel_subscriptions"
        /// Reset a channel’s stream key.
        public static let v5_chanStream: TWScope = "channel_stream"
        /// Read nonpublic channel information, including email address and stream key.
        public static let v5_chanRead: TWScope = "channel_read"
        /// View analytics data for your games.
        public static let analyticsReadGames: TWScope = "analytics:read:games"
        /// View analytics data for your extensions.
        public static let analyticsReadExtensions: TWScope = "analytics:read:extensions"
    }
}
