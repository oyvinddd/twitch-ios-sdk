//
//  TWFollow.swift
//  Screencast
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWFollow: Codable {
    
    /// ID of the user following the to_id user.
    public var fromId: String
    
    /// Display name corresponding to from_id.
    public var fromName: String
    
    /// ID of the user being followed by the from_id user.
    public var toId: String
    
    /// Display name corresponding to to_id.
    public var toName: String
    
    /// Date and time when the from_id user followed the to_id user.
    public var followedAt: String
}
