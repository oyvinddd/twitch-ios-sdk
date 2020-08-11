//
//  TWStreamTag.swift
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWStreamTag: Codable {
    
    /// ID of the tag.
    public var tagId: String
    
    /// true if the tag is auto-generated; otherwise, false . An auto-generated tag is one automatically applied by Twitch
    /// (e.g., a language tag based on the broadcaster’s settings); these cannot be added or removed by the user.
    public var isAuto: Bool
    
    /// All localized names of the tag.
    public var localizationNames: [String: String]
    
    /// All localized descriptions of the tag.
    public var localizationDescriptions: [String: String]
}
