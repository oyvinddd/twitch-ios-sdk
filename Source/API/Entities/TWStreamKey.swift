//
//  TWStreamKey.swift
//  Twitch
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWStreamKey: Codable {
    
    /// Stream key for the channel
    public var streamKey: String
}

//extension TWStreamKey: Codable {
//    
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        key = try values.decode(String.self, forKey: .key)
//    }
//}
