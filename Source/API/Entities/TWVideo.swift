//
//  TWVideo.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWVideo: Codable {
    
    /// Possible video types
    public enum TWVideoType: String, Encodable {
        case upload, archive, highlight
    }
    
    /// ID of the video.
    public var id: String
    
    /// ID of the user who owns the video.
    public var userId: String
    
    /// Display name corresponding to user_id.
    public var userName: String
    
    /// Title of the video.
    public var title: String
    
    /// Description of the video.
    public var description: String
    
    /// Date when the video was created.
    public var createdAt: String
    
    /// Date when the video was published.
    public var publishedAt: String
    
    /// URL of the video.
    public var url: String
    
    /// Template URL for the thumbnail of the video.
    public var thumbnailUrl: String
    
    /// Indicates whether the video is publicly viewable. Valid values: "public", "private".
    public var viewable: String
    
    /// Number of times the video has been viewed.
    public var viewCount: Int
    
    /// Language of the video.
    public var language: String
    
    /// Type of video. Valid values: "upload", "archive", "highlight".
    public var type: String
    
    /// Length of the video.
    public  var duration: String
}
