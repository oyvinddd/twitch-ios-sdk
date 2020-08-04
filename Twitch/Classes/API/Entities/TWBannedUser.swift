//
//  TWBannedUser.swift
//  Screencast
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWBannedUser: Codable {
    
    /// User ID of a user who has been banned.
    var userId: String
    
    /// Display name of a user who has been banned.
    var userName: String
    
    /// RFC3339 formatted timestamp for timeouts; empty string for bans.
    var expiresAt: String
}
