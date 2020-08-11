//
//  TWIngest.swift
//  Twitch
//
//  Created by Øyvind Hauge on 21/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWIngest: Codable {
    
    public var id: Int
    
    public var template: String
    
    public var availability: Double
    
    public var name: String
    
    public var `default`: Bool
}
