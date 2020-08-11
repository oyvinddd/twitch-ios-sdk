//
//  TWContainer.swift
//  Twitch
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWContainer<T: Codable>: Codable {
    
    /// Contains whatever content was requested (e.g. [TWUser], TWStreamKey etc.)
    public var data: T
    
    /// Total number of items returned.
    public var total: Int?
    
    /// A cursor value, to be used in a subsequent request to specify the starting point of the next set of results.
    var pagination: TWCursor?
    
    enum CodingKeys: String, CodingKey {
        case data, total, pagination
    }
    
    init(_ data: T, total: Int? = nil, pagination: TWCursor? = nil) {
        self.data = data
        self.total = total
        self.pagination = pagination
    }
}

public struct TWCursor: Codable {
    public var cursor: String?
}
