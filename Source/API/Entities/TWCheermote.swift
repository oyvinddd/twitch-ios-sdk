//
//  TWCheermote.swift
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWCheermoteContainer: Codable {
    
    public enum TWEmoteType: String, Codable {
        case globalFirstParty = "global_first_party"
        case globalThirdParty = "global_third_party"
        case channelCustom = "channel_custom"
        case displayOnly = "display_only"
        case sponsored = "sponsored"
    }
    
    /// No information given
    public var prefix: String?
    
    /// An array of Cheermotes with their metadata.
    public var tiers: [TWCheermote]
    
    /// Shows whether the emote is global_first_party,  global_third_party, channel_custom, display_only, or sponsored.
    public var type: TWEmoteType
    
    /// Order of the emotes as shown in the bits card, in ascending order.
    public var order: Int
    
    /// The data when this Cheermote was last updated.
    public var lastUpdated: String
    
    /// Indicates whether or not this emote provides a charity contribution match during charity campaigns.
    public var isCharitable: Bool
}

public struct TWCheermote: Codable {
    
    /// ID of the emote tier. Possible tiers are: 1,100,500,1000,5000, 10k, or 100k.
    public var id: String
    
    /// Minimum number of bits needed to be used to hit the given tier of emote.
    public var minBits: Int
    
    /// Hex code for the color associated with the bits of that tier. Grey, Purple, Teal, Blue, or Red color to match the base bit type.
    public var color: String
    
    /// Indicates whether or not emote information is accessible to users.
    public var canCheer: Bool
    
    /// Indicates whether or not we hide the emote from the bits card.
    public var showInBitsCard: Bool
    
    /// Structure containing both animated and static image sets, sorted by light and dark.
    public var images: [String: [String: [String: String]]]
}
