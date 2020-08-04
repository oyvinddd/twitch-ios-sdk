//
//  TWVideo.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWVideo: Codable {
    var id: String?
    var userId: String?
    var userName: String?
    var title: String?
    var description: String?
    var createdAt: String?
    var publishedAt: String?
    var url: String?
    var thumbnailUrl: String?
    var viewable: String?
    var viewCount: Int?
    var language: String?
    var type: String?
    var duration: String?
}
