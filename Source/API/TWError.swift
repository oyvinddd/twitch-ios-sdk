//
//  TWError.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWError: Error, Decodable {
    
    public static let unknown = TWError("Unknown error", status: 900)
    public static let decodingFailed = TWError("Decoding failed", status: 901)
    
    enum CodingKeys: String, CodingKey {
        case message, status, error
    }
    var message: String
    var status: Int
    var error: String?
    public var errorDescription: String? {
        return "\(status) - \(message)"
    }
    
    init(_ message: String, status: Int, error: String? = nil) {
        self.message = message
        self.status = status
        self.error = error
    }
}
