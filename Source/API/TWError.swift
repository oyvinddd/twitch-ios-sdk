//
//  TWError.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

protocol TWError: Error, Decodable {
    var message: String { get }
    var status: Int { get }
    var error: String { get }
    var localizedDescription: String { get }
}

struct TWAPIError: TWError {
    
    static let unknown = TWAPIError(message: "Unknown error", status: 900, error: "Something went wrong")
    static let decodingFailed = TWAPIError(message: "Decoding failed", status: 901, error: "Something went wrong")
    
    var message: String
    var status: Int
    var error: String
    public var localizedDescription: String {
        return message
    }
    
    enum CodingKeys: String, CodingKey {
        case message, status, error
    }
}
