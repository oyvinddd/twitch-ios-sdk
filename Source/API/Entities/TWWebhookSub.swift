//
//  TWWebhookSub.swift
//  Pods-TwitchTester
//
//  Created by Øyvind Hauge on 14/08/2020.
//

import Foundation

public struct TWWebhookSub: Codable {
    
    /// The callback provided for this subscription.
    public var callback: String
    
    /// Date and time when this subscription expires. Encoded as RFC3339. The timezone is always UTC (“Z”).
    public var expiresAt: String
    
    /// The topic used in the initial subscription.
    public var topic: String
}
