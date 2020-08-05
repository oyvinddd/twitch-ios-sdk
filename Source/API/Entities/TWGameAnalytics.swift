//
//  TWGameAnalytics.swift
//  Screencast
//
//  Created by Øyvind Hauge on 03/08/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWGameAnalytics: Codable {
    
    /// ID of the game whose analytics data is being provided.
    public var gameId: String
    
    /// A cursor value, to be used in a subsequent request to specify the starting point of the next set of results. This is returned only if game_id is not specified in the request.
    public var pagination: String // TODO: wrong
    
    /// Report start date/time.
    public var startedAt: String
    
    /// Report end date/time.
    public var endedAt: String
    
    /// Type of report
    public var type: String
    
    /// URL to the downloadable CSV file containing analytics data. Valid for 5 minutes.
    public var url: String
}
