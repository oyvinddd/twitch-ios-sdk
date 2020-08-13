//
//  TWModeratorEvent.swift
//  Twitch
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWModeratorEvent: Codable {
    
    /// User ID of the moderator.
    public var id: String
    
    /// Displays moderation.user.ban or moderation.user.unban
    public var eventType: String
    
    /// RFC3339 formatted timestamp for events.
    public var eventTimestamp: String
    
    /// Returns the version of the endpoint.
    public var version: String
}

public struct TWEventData {
    // TODO:
}
