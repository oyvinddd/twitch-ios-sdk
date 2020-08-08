//
//  TWStreamKey.swift
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWStreamKey: Codable {
    
    /// Stream key for the channel
    public var key: String
    
    enum CodingKeys: String, CodingKey {
        case key = "stream_key"
    }
}
