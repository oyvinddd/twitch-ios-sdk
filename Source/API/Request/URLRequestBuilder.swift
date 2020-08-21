//
//  URLRequestBuilder.swift
//  Twitch
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

/// Authorization header field
fileprivate let kHeaderAuthorization = "Authorization"

/// Client ID header field
fileprivate let kHeaderClientId = "Client-ID"

/// Regular Twitch API base url
fileprivate let kApiBaseUrl = "https://api.twitch.tv"

/// Twitch auth base url
fileprivate let kAuthBaseUrl = "https://id.twitch.tv"

final class URLRequestBuilder {
    
    enum TwitchService {
        case api, auth
    }
    
    var baseURL: URL {
        return service == .api ? URL(string: kApiBaseUrl)!
            : URL(string: kAuthBaseUrl)!
    }
    var service: TwitchService
    var endpoint: TWEndpoint
    var method: HTTPMethod = .get
    var headers: [String: String]?
    var clientId: String?
    var accessToken: String?
    var params: [TWParam]?
    var body: Data?
    
    init(service: TwitchService = .api, endpoint: TWEndpoint) {
        self.service = service
        self.endpoint = endpoint
    }
    
    @discardableResult
    func set(method: HTTPMethod) -> Self {
        self.method = method
        return self
    }
    
    @discardableResult
    func set(endpoint: TWEndpoint) -> Self {
        self.endpoint = endpoint
        return self
    }
    
    @discardableResult
    func set(headers: [String: String]?) -> Self {
        self.headers = headers
        return self
    }
    
    @discardableResult
    func set(params: [TWParam]?) -> Self {
        self.params = params
        return self
    }
    
    @discardableResult
    func set(clientId: String?) -> Self {
        self.clientId = clientId
        return self
    }
    
    @discardableResult
    func set(accessToken: String?) -> Self {
        self.accessToken = accessToken
        return self
    }
    
    @discardableResult
    func set(body: Data?) -> Self {
        self.body = body
        return self
    }
    
    func build() -> URLRequest {
        
        // create url and add query parameters
        var url = baseURL.appendingPathComponent(endpoint)
        if let params = params, !params.isEmpty, var comps = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            var queryItems: [URLQueryItem] = []
            for param in params {
                queryItems.append(URLQueryItem(name: param.name, value: param.value))
            }
            comps.queryItems = queryItems
            if let newUrl = comps.url {
                url = newUrl
            }
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        // request method
        request.httpMethod = method.rawValue
        
        // add headers
        addHeaders(&request)
        addAuthHeaders(&request)
        
        // request body
        if let jsonData = body {
            request.httpBody = jsonData
        }
        return request
    }
    
    private func addHeaders(_ request: inout URLRequest) {
        if let headers = headers {
            for header in headers {
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
    }
    
    private func addAuthHeaders(_ request: inout URLRequest) {
        if let cID = clientId {
            request.addValue(cID, forHTTPHeaderField: kHeaderClientId)
        }
        if let token = accessToken {
            request.addValue("Bearer \(token)", forHTTPHeaderField: kHeaderAuthorization)
        }
    }
    
    private func defaultHeaders() -> [String: String] {
        return ["Content-Type": "application/json"]
    }
}

extension URLRequestBuilder {
    
    static func buildSecureAPIRequest<T: TWRequest>(for request: T) -> URLRequest {
        return URLRequestBuilder(service: .api, endpoint: request.endpoint)
            .set(headers: ["Content-Type": "application/json"])
            .set(accessToken: Twitch.credentials.accessToken)
            .set(clientId: Twitch.credentials.clientId)
            .set(method: request.method)
            .set(params: request.params)
            .set(body: request.body)
            .build()
    }
    
    static func buildOpenAPIRequest<T: TWRequest>(for request: T) -> URLRequest {
        return URLRequestBuilder(service: .api, endpoint: request.endpoint)
            .set(headers: ["Content-Type": "application/json"])
            .set(clientId: Twitch.credentials.clientId)
            .set(method: request.method)
            .set(params: request.params)
            .set(body: request.body)
            .build()
    }
    
    static func buildAuthRequest<T: TWRequest>(for request: T) -> URLRequest {
        return URLRequestBuilder(service: .auth, endpoint: request.endpoint)
            .set(method: request.method)
            .set(params: request.params)
            .build()
    }
    
    func decode<T: Decodable>(from data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}
