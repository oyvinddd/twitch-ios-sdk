//
//  TWChannel.swift
//  Screencast
//
//  Created by Øyvind Hauge on 02/08/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWChannel: Codable {
    
    /// Channel ID
    public var id: String
    
    /// ID of the game being played on the stream
    public var gameId: String
    
    /// Display name corresponding to user_id
    public var displayName: String
    
    /// Channel language (Broadcaster Language field from the Channels service)
    public var broadcasterLanguage: String
    
    /// Channel title
    public var title: String
    
    /// Thumbnail URL of the stream. All image URLs have variable width and height. You can replace {width} and {height} with any values to get that size image.
    public var thumbnailUrl: String
    
    /// Live status
    public var isLive: Bool
    
    /// UTC timestamp. (live only)
    public var startedAt: String
    
    /// Shows tag IDs that apply to the stream (live only).See https://www.twitch.tv/directory/all/tags for tag types
    public var tagIds: [String]
}
