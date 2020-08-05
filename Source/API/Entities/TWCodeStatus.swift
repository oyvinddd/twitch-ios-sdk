//
//  TWCodeStatus.swift
//  Screencast
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWCodeStatus: Codable {
    public enum TWStatus: String, Codable {
        
        /// Request successfully redeemed this code to the authenticated user’s account. This status will only ever be encountered when calling the POST API to redeem a key.
        case successfullyRedeemed = "SUCCESSFULLY_REDEEMED"
        
        /// Code has already been claimed by a Twitch user.
        case alreadyClaimed = "ALREADY_CLAIMED"
        
        /// Code has expired and can no longer be claimed.
        case expired = "EXPIRED"
        
        /// User is not eligible to redeem this code.
        case userNotEligible = "USER_NOT_ELIGIBLE"
        
        /// Code is not valid and/or does not exist in our database.
        case notFound = "NOT_FOUND"
        
        /// Code is not currently active.
        case inactive = "INACTIVE"
        
        /// Code has not been claimed.This status will only ever be encountered when calling the GET API to get a key’s status.
        case unused = "UNUSED"
        
        /// Code was not properly formatted.
        case incorrectFormat = "INCORRECT_FORMAT"
        
        /// Indicates some internal and/or unknown failure handling this code.
        case internalError = "INTERNAL ERROR"
    }
    
    /// The code to redeem to the authenticated user’s account.
    public var code: String?
    
    public var status: TWStatus?
}
