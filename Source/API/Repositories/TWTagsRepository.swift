//
//  TWTagsRepository.swift
//  Screencast
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWTagsRepository: TWTagsAPI {
    let session: URLSession = URLSession.shared
    
    func getAllTags(tagId: String?, after: String?, first: Int?, result: @escaping TWContainerBlock<[TWStreamTag]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWAllStreamTagsRequest(tagId: tagId, after: after, first: first))
        session.dataTask(with: request, decodable: [TWStreamTag].self, result: result).resume()
    }
}
