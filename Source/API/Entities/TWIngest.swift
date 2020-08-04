//
//  TWIngest.swift
//  Screencast
//
//  Created by Øyvind Hauge on 21/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWIngest: Codable {
    var id: Int?
    var template: String?
    var availability: Double?
    var name: String?
    var def: Bool?
}
