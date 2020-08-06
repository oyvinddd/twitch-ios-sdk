//
//  TWAuthViewController.swift
//  Screencast
//
//  Created by Øyvind Hauge on 20/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation
import WebKit

public protocol TWAuthDelegate: class {
    func didFetch(idToken: String, accessToken: String)
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
        if isCorrectRedirectURL(webView.url) {
            evaluateRedirectURL(webView.url)
            dismiss(animated: true, completion: nil)
        }
    }
    
    // TODO: improve this method
    private func evaluateRedirectURL(_ url: URL?) {
        if let urlString = url?.absoluteString {
            let parts = urlString.components(separatedBy: ["=", "&"])
            let idToken = parts[1]
            let accessToken = parts[1] // TODO: ...
            delegate?.didFetch(idToken: idToken, accessToken: accessToken)
        }
    }
    
    fileprivate func isCorrectRedirectURL(_ url: URL?) -> Bool {
        let redirectUri = Twitch.config.redirectUri
        guard let urlStr = url?.absoluteString, urlStr.count >= redirectUri.count else {
            return false
        }
        let index = urlStr.index(urlStr.startIndex, offsetBy: redirectUri.count)
        let substring = urlStr.prefix(upTo: index)
        return substring == redirectUri
    }
}
