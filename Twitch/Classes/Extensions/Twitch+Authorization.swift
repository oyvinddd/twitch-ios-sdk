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
    
    func presentAuthWebView(from parent: UIViewController, animated: Bool = true, delegate: TWAuthDelegate?) {
        let authViewController = TWAuthViewController(delegate: delegate)
        authViewController.url = Twitch.buildAuthURL()
        parent.present(authViewController, animated: animated, completion: nil)
    }
    
    class func buildAuthURL() -> URL? {
        let baseURL = "https://id.twitch.tv/oauth2/authorize"
        let cId = "?client_id=\(Twitch.credentials.clientId)"
        let responseType = "&response_type=token"
        let redir = "&redirect_uri=\(Twitch.config.redirectUri)"
        let scope = "&scope=viewing_activity_read+openid"
        return URL(string: "\(baseURL)\(cId)\(responseType)\(redir)\(scope)")
    }
}
