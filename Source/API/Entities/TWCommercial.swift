//
//  TWCommercial.swift
//  Pods-Screencast
//
//  Created by Øyvind Hauge on 12/08/2020.
//

import Foundation

public struct TWCommercial: Codable {
    
    /// Length of the triggered commercial
    public var length: Int
    
    /// Provides contextual information on why the request failed
    public var message: String
    
    /// Seconds until the next commercial can be served on this channel
    public var retryAfter: Int
}
