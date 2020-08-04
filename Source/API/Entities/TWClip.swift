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
    var id: String
    
    /// URL where the clip can be viewed.
    var url: String
    
    /// URL to embed the clip.
    var embedUrl: String
    
    /// User ID of the stream from which the clip was created.
    var broadcasterId: String
    
    /// Display name corresponding to broadcaster_id.
    var broadcasterName: String
    
    /// ID of the user who created the clip.
    var creatorId: String
        
    /// ID of the video from which the clip was created.
    var videoId: String
    
    /// ID of the game assigned to the stream when the clip was created.
    var gameId: String
    
    /// Language of the stream from which the clip was created.
    var language: String
    
    /// Title of the clip.
    var title: String
    
    /// Number of times the clip has been viewed.
    var viewCount: Int
    
    /// Date when the clip was created.
    var createdAt: String
    
    /// URL of the clip thumbnail.
    var thumbnailUrl: String
}
