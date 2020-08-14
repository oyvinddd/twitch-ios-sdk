//
//  TWTransaction.swift
//  Twitch
//
//  Created by Øyvind Hauge on 14/08/2020.
//

import Foundation

public struct TWTransaction: Codable {
    
    /// Unique identifier of the Bits in Extensions Transaction.
    public var id: String
    
    /// UTC timestamp when this transaction occurred.
    public var timestamp: String
    
    /// Twitch User ID of the channel the transaction occurred on.
    public var broadcasterId: String
    
    /// Twitch Display Name of the broadcaster.
    public var broadcasterName: String
    
    /// Twitch User ID of the user who generated the transaction.
    public var userId: String
    
    /// Twitch Display Name of the user who generated the transaction.
    public var userName: String
    
    /// Enum of the product type. Currently only BITS_IN_EXTENSION.
    public var productType: String
    
    /// Set this field to twitch.ext + your extension ID.
    public var domain: String
    
    /// Flag that denotes whether or not the data was sent over the extension pubsub to all instances of the extension.
    public var broadcast: Bool
    
    /// Always empty since only unexpired products can be purchased.
    public var expiration: String
    
    /// Unique identifier for the product across the extension.
    public var sku: String
}
