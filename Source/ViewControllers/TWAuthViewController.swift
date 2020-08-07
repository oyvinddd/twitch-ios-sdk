//
//  TWAuthViewController.swift
//  Screencast
//
//  Created by Øyvind Hauge on 20/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation
import WebKit

// TODO: two separate delegates for OAuth/OIDC
public protocol TWAuthDelegate: class {
    func didFetchOAuthToken(_ accessToken: String)
    func didFetchOIDCToken(_ accessToken: String, idToken: String)
}

public final class TWAuthViewController: UIViewController {
    
    public weak var delegate: TWAuthDelegate?
    private var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    public init(delegate: TWAuthDelegate? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle Methods
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViews()
        webView.navigationDelegate = self
        webView.load(URLRequestBuilder
            .buildAuthRequest(for: TWOAuthRequest()))
    }
    
    private func setupChildViews() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: Web Kit Navigation Delegate

extension TWAuthViewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        if isCorrectRedirectURL(webView.url), let accessToken = extractFragment("access_token", from: webView.url) {
            delegate?.didFetchOAuthToken(accessToken)
            dismiss(animated: true, completion: nil)
        }
    }
    
    private func isCorrectRedirectURL(_ url: URL?) -> Bool {
        let redirectUri = Twitch.config.redirectUri
        guard let urlStr = url?.absoluteString, urlStr.count >= redirectUri.count else {
            return false
        }
        let index = urlStr.index(urlStr.startIndex, offsetBy: redirectUri.count)
        let substring = urlStr.prefix(upTo: index)
        return substring == redirectUri
    }
    
    private func extractFragment(_ param: String, from url: URL?) -> String? {
        guard let urlString = url?.absoluteString, let comps = URLComponents(string: urlString), let fragment = comps.fragment else {
            return nil
        }
        let dict = fragment.components(separatedBy: "&").map({
            $0.components(separatedBy: "=")
        }).reduce(into: [String:String]()) { dict, pair in
            if pair.count == 2 {
                dict[pair[0]] = pair[1]
            }
        }
        return dict[param]
    }
}
