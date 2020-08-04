//
//  TWLeaderboard.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWLeaderboard: Codable {
    
    
    var userId: String
    var userName: String
    var rank: Int
    var score: Int
}
