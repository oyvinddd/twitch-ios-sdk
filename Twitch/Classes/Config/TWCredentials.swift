//
//  TWCredentials.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWCredentials {
    
    var clientId: String
    var accessToken: String?
    var idToken: String?
    var hasValidTokens: Bool {
        return accessToken != nil && idToken != nil
    }
    
    init(clientId: String) {
        self.clientId = clientId
    }
    
    mutating func set(accessToken: String?, idToken: String?) {
        self.accessToken = accessToken
        self.idToken = idToken
    }
    
    mutating func clear() {
        accessToken = nil
        idToken = nil
    }
}
