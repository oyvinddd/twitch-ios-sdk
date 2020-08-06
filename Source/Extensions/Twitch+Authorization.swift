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
//        authViewController.url = Twitch.buildAuthURL()
        parent.present(authViewController, animated: animated, completion: nil)
    }
}
