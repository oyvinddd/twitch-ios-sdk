//
//  TWUser.swift
//  Screencast
//
//  Created by Øyvind Hauge on 29/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWUser: Codable {
    var id: String?
    var login: String?
    var displayName: String?
    var type: String?
    var broadcasterType: String?
    var description: String?
    var profileImageUrl: String?
    var offlineImageUrl: String?
    var viewCount: Int64?
    var email: String?
}
