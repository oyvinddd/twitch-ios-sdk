//
//  TWUser.swift
//  Screencast
//
//  Created by Øyvind Hauge on 29/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWUser: Codable {
    
    /// User’s ID.
    var id: String
    
    /// User’s login name.
    var login: String
    
    /// User’s display name.
    var displayName: String
    
    /// User’s type: "staff", "admin", "global_mod", or "".
    var type: String
    
    /// User’s broadcaster type: "partner", "affiliate", or "".
    var broadcasterType: String
    
    /// User’s channel description.
    var description: String
    
    /// URL of the user’s profile image.
    var profileImageUrl: String
    
    /// URL of the user’s offline image.
    var offlineImageUrl: String
        
    /// Total number of views of the user’s channel.
    var viewCount: Int64
    
    /// User’s email address. Returned if the request includes the user:read:email scope.
    var email: String
}
