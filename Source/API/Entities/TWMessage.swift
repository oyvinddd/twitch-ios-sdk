//
//  TWMessage.swift
//
//  Created by Øyvind Hauge on 02/08/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWMessage: Codable {
    
    /// Developer-generated identifier for mapping messages to results.
    public var id: String
    
    /// Message text.
    public var text: String
    
    /// User ID of the sender.
    public var userId: String
    
    public init(_ id: String, _ text: String, _ userId: String) {
        self.id = id
        self.text = text
        self.userId = userId
    }
}

public struct TWMessageStatus: Codable {
    
    /// The msg_id passed in the body of the POST message. Maps each message to its status.
    public var messageId: String
    
    /// Indicates if this message meets AutoMod requirements.
    public var isPermitted: Bool
}
