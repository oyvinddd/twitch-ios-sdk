//
//  TWModerator.swift
//  Twitch
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWModerator: Codable {
    
    /// User ID of a user who has been banned.
    public var userId: String
    
    /// Display name of a user who has been banned.
    public var userName: String
}
