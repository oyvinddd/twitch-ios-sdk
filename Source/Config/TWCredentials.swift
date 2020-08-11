//
//  TWCredentials.swift
//  Twitch
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWCredentials {
    
    var clientId: String
    var accessToken: String?
    var idToken: String?
    
    init(clientId: String) {
        self.clientId = clientId
    }
    
    public mutating func set(accessToken: String?, idToken: String?) {
        self.accessToken = accessToken
        self.idToken = idToken
    }
    
    public mutating func set(accessToken: String?) {
        self.accessToken = accessToken
    }
    
    public mutating func set(idToken: String?) {
        self.idToken = idToken
    }
    
    public mutating func clear() {
        accessToken = nil
        idToken = nil
    }
}
