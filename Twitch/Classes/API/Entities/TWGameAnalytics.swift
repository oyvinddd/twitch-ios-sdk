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
    var gameId: String
    
    /// A cursor value, to be used in a subsequent request to specify the starting point of the next set of results. This is returned only if game_id is not specified in the request.
    var pagination: String // TODO: wrong
    
    /// Report start date/time.
    var startedAt: String
    
    /// Report end date/time.
    var endedAt: String
    
    /// Type of report
    var type: String
    
    /// URL to the downloadable CSV file containing analytics data. Valid for 5 minutes.
    var url: String
}
