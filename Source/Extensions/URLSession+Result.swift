//
//  URLSession+Result.swift
//  Screencast
//
//  Created by Øyvind Hauge on 29/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

extension URLSession {
    func dataTask(with request: URLRequest, result: @escaping TWNoContentBlock) -> URLSessionDataTask {
        return dataTask(with: request) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let urlResponse = response as? HTTPURLResponse else {
                result(.failure(TWError.unknown))
                return
            }
            guard 200..<300 ~= urlResponse.statusCode else {
                print("Status code was \(urlResponse.statusCode), but expected 2xx")
                result(.failure(TWError.unknown))
                return
            }
            result(.success)
        }
    }
}
