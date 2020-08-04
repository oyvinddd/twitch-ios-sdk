//
//  TWStreamMarker.swift
//  Screencast
//
//  Created by Øyvind Hauge on 03/08/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWStreamMarker: Codable {
    
    /// Unique ID of the marker.
    var id: String
    
    /// Description of the marker.
    var description: String
    
    /// Relative offset (in seconds) of the marker, from the beginning of the stream.
    var positionSeconds: Int
    
    /// RFC3339 timestamp of the marker.
    var createdAt: String
}
