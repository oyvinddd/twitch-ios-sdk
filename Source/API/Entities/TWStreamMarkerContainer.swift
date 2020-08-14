//
//  TWStreamMarkerContainer.swift
//  Twitch
//
//  Created by Øyvind Hauge on 14/08/2020.
//

import Foundation

public struct TWStreamMarkerContainer: Codable {
    
    /// ID of the user whose markers are returned.
    public var userId: String
    
    /// Display name corresponding to user_id.
    public var userName: String
}
