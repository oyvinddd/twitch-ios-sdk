//
//  TWClip.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWClip: Codable {
    
    /// ID of the clip being queried.
    public var id: String
    
    /// URL where the clip can be viewed.
    public var url: String
    
    /// URL to embed the clip.
    public var embedUrl: String
    
    /// User ID of the stream from which the clip was created.
    public var broadcasterId: String
    
    /// Display name corresponding to broadcaster_id.
    public var broadcasterName: String
    
    /// ID of the user who created the clip.
    public var creatorId: String
        
    /// ID of the video from which the clip was created.
    public var videoId: String
    
    /// ID of the game assigned to the stream when the clip was created.
    public var gameId: String
    
    /// Language of the stream from which the clip was created.
    public var language: String
    
    /// Title of the clip.
    public var title: String
    
    /// Number of times the clip has been viewed.
    public var viewCount: Int
    
    /// Date when the clip was created.
    public var createdAt: String
    
    /// URL of the clip thumbnail.
    public var thumbnailUrl: String
}
