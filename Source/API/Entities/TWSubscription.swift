//
//  TWSubscription.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWSubscription: Codable {
    
    /// User ID of the broadcaster.
    public var broadcasterId: String
    
    /// Display name of the broadcaster.
    public var broadcasterName: String
    
    /// Determines if the subscription is a gift subscription.
    public var isGift: Bool
    
    /// Type of subscription (Tier 1, Tier 2, Tier 3). 1000 = Tier 1, 2000 = Tier 2, 3000 = Tier 3 subscriptions.
    public var tier: String
    
    /// Name of the subscription.
    public var planName: String
    
    /// ID of the subscribed user.
    public var userId: String
    
    /// Display name of the subscribed user. 
    public var userName: String
}
