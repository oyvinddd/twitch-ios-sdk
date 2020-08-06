//
//  TWExtension.swift
//  Screencast
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

public struct TWExtension: Codable {
    
    /// Type of extension
    public enum TWExtensionType: String, Codable {
        case component = "component", mobile = "mobile", panel = "panel", overlay = "overlay"
    }
    
    /// ID of the extension.
    public var id: String
    
    /// Indicates whether the extension is configured such that it can be activated.
    public var canActivate: Bool
    
    /// Name of the extension.
    public var name: String
    
    /// Types for which the extension can be activated. Valid values: "component", "mobile", "panel", "overlay".
    public var type: [TWExtensionType]
    
    /// Version of the extension.
    public var version: String
}
