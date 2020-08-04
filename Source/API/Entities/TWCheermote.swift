//
//  TWCheermote.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

// Shows whether the emote is global_first_party,  global_third_party, channel_custom, display_only, or sponsored.

public struct TWCheermoteContainer: Codable {
    /// An array of Cheermotes with their metadata.
    var tiers: [TWCheermote]
}

public struct TWCheermote: Codable {
    enum TWEmoteType: String, Codable {
        case globalFirstParty = "global_first_party"
        case globalThirdParty = "global_third_party"
        case channelCustom = "channel_custom"
        case displayOnly = "display_only"
        case sponsored = "sponsored"
    }
    
    /// ID of the emote tier. Possible tiers are: 1,100,500,1000,5000, 10k, or 100k.
    var id: String
    
    /// Minimum number of bits needed to be used to hit the given tier of emote.
    var minBits: Int
    
    /// Hex code for the color associated with the bits of that tier. Grey, Purple, Teal, Blue, or Red color to match the base bit type.
    var color: String
    
    /// Indicates whether or not emote information is accessible to users.
    var canCheer: Bool
    
    /// Indicates whether or not we hide the emote from the bits card.
    var showInBitsCard: Bool
    
    /// Shows whether the emote is global_first_party,  global_third_party, channel_custom, display_only, or sponsored.
    var type: TWEmoteType
    
    /// Order of the emotes as shown in the bits card, in ascending order.
    var order: Int
    
    /// The data when this Cheermote was last updated.
    var lastUpdated: String
    
    /// Indicates whether or not this emote provides a charity contribution match during charity campaigns.
    var isCharitable: Bool
}

public struct TWCheermoteImages: Codable {
    /// Structure containing both animated and static image sets, sorted by light and dark.
    var images: [String]
}
