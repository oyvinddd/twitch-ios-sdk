//
//  Twitch+Authorization.swift
//  Screencast
//
//  Created by Øyvind Hauge on 20/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import UIKit
import WebKit

extension Twitch {
    
    public func presentAuthWebView(from parent: UIViewController, animated: Bool = true, delegate: TWAuthDelegate?) {
        let authViewController = TWAuthViewController(delegate: delegate)
        authViewController.url = Twitch.buildAuthURL()
        parent.present(authViewController, animated: animated, completion: nil)
    }
    
    public static func buildAuthURL() -> URL {
        let baseURL = "https://id.twitch.tv/oauth2/authorize"
        let cId = "?client_id=\(Twitch.credentials.clientId)"
        let responseType = "&response_type=token"
        let redir = "&redirect_uri=\(Twitch.config.redirectUri)"
        let scope = "&scope=viewing_activity_read+openid"
        let urlString = "\(baseURL)\(cId)\(responseType)\(redir)\(scope)"
        //return URL(string: urlString)
        return URL(string: "https://id.twitch.tv/oauth2/authorize?response_type=token&client_id=ipwdkinbxmrpbgnxa91as9gs9ty9qw&redirect_uri=http://localhost&scope=viewing_activity_read")!
    }
}
