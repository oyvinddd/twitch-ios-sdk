//
//  TWGame.swift
//  Screencast
//
//  Created by Øyvind Hauge on 21/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWGame: Codable {
    
    /// Game ID.
    public var id: String
    
    /// Game name.
    public var name: String
    
    /// Template URL for the game’s box art.
    public var boxArtUrl: String
}
