//
//  TWAuthViewController.swift
//  Twitch
//
//  Created by Øyvind Hauge on 20/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation
import WebKit

public protocol TWOAuthDelegate: class {
    func didFetchToken(_ accessToken: String)
}

public final class TWAuthViewController: UIViewController {
    
    public weak var delegate: TWOAuthDelegate?
    private var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    public init(delegate: TWOAuthDelegate? = nil) {
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
        handleRedirect(url: webView.url)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let response = navigationResponse.response as? HTTPURLResponse, 500 ..< 600 ~= response.statusCode {
            print("Twitch - Status code was \(response.statusCode), but expected 2xx. Twitch might be temporarily down.")
            dismiss(animated: true, completion: nil)
        }
        decisionHandler(.allow)
    }
    
    // MARK: Private helper Methods
    
    private func handleRedirect(url: URL?) {
        if isCorrectRedirectURL(webView.url), let token = extractFragment("access_token", from: webView.url) {
            Twitch.credentials.set(accessToken: token)
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
