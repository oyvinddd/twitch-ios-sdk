//
//  TWStream.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWStream: Codable {
    
    /// Stream ID.
    public var id: String?
    
    /// ID of the user who is streaming.
    public var userId: String?
    
    /// Display name corresponding to user_id.
    public var userName: String?
    
    /// ID of the game being played on the stream.
    public var gameId: String?
    
    /// Stream type: "live" or "" (in case of error).
    public var type: String
    
    /// Stream title.
    public var title: String
    
    /// Number of viewers watching the stream at the time of the query.
    public var viewerCount: Int
    
    /// UTC timestamp.
    public var startedAt: String
    
    /// Stream language.
    public var language: String
    
    /// Thumbnail URL of the stream. All image URLs have variable width and height. You can replace {width} and {height} with any values to get that size image
    public var thumbnailUrl: String
}
