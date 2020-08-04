//
//  TWMessage.swift
//  Screencast
//
//  Created by Øyvind Hauge on 02/08/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWMessage: Codable {
    
    /// Developer-generated identifier for mapping messages to results.
    var id: String
    
    /// Message text.
    var text: String
    
    /// User ID of the sender.
    var userId: String
}

public struct TWMessageStatus: Codable {
    
    /// The msg_id passed in the body of the POST message. Maps each message to its status.
    var messageId: String
    
    /// Indicates if this message meets AutoMod requirements.
    var isPermitted: Bool
}
