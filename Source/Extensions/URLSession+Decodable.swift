//
//  URLSession+Decodable.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

extension URLSession {
    typealias DecodableResultBlock = (Result<Decodable, Error>) -> Void

    func dataTask<T: Decodable>(with request: URLRequest, decodable: T.Type, result: @escaping TWContainerBlock<T>) -> URLSessionDataTask {
        return dataTask(with: request) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let urlResponse = response as? HTTPURLResponse, let data = data else {
                result(.failure(TWError.unknown))
                return
            }
            guard 200 ..< 300 ~= urlResponse.statusCode else {
                print("Status code was \(urlResponse.statusCode), but expected 2xx")
                do {
                    let error: TWError = try self.decode(from: data)
                    result(.failure(error))
                } catch {
                    result(.failure(TWError.unknown))
                }
                return
            }
            do {
                let container: TWContainer<T> = try self.decode(from: data)
                result(.success(container))
            } catch {
                result(.failure(TWError.decodingFailed))
            }
        }
    }
    
    fileprivate func decode<T: Decodable>(from data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}
