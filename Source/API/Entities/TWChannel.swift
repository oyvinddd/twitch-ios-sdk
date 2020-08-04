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
    var id: String
    
    /// ID of the game being played on the stream
    var gameId: String
    
    /// Display name corresponding to user_id
    var displayName: String
    
    /// Channel language (Broadcaster Language field from the Channels service)
    var broadcasterLanguage: String
    
    /// Channel title
    var title: String
    
    /// Thumbnail URL of the stream. All image URLs have variable width and height. You can replace {width} and {height} with any values to get that size image.
    var thumbnailUrl: String
    
    /// Live status
    var isLive: Bool
    
    /// UTC timestamp. (live only)
    var startedAt: String
    
    /// Shows tag IDs that apply to the stream (live only).See https://www.twitch.tv/directory/all/tags for tag types
    var tagIds: [String]
}
