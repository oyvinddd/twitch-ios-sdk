//
//  TWChannelInfo.swift
//  Screencast
//
//  Created by Øyvind Hauge on 03/08/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWChannelInfo: Codable {
    
    /// Twitch User ID of this channel owner
    public var broadcasterId: String
    
    /// Name of the game being played on the channel
    public var gameName: String
    
    /// Current game ID being played on the channel
    public var gameId: String
    
    /// Language of the channel
    public var broadcasterLanguage: String
    
    /// Title of the stream
    public var title: String
}
