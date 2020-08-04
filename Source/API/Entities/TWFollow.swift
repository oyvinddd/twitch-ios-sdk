//
//  TWFollow.swift
//  Screencast
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWFollow: Codable {
    var fromId: String?
    var fromName: String?
    var toId: String?
    var toName: String?
    var followedAt: String?
}
