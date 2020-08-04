//
//  TWExtension.swift
//  Screencast
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWExtension: Codable {
    
    enum TWExtensionType: String, Codable {
        case component, mobile, panel, overlay
    }
    
    /// ID of the extension.
    var id: String
    
    /// Indicates whether the extension is configured such that it can be activated.
    var canActivate: Bool
    
    /// Name of the extension.
    var name: String
    
    /// Types for which the extension can be activated. Valid values: "component", "mobile", "panel", "overlay".
    var type: [TWExtensionType]
    
    /// Version of the extension.
    var version: String
}
