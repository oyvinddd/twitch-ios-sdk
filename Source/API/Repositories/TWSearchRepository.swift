//
//  TWSearchRepository.swift
//  Twitch
//
//  Created by Øyvind Hauge on 02/08/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWSearchRepository: TWSearchAPI {
    let session: URLSession = URLSession.shared
    
    func searchCategories(query: String, first: Int?, after: String?, result: @escaping TWContainerBlock<[TWGame]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWSearchCategoriesRequest(query, first: first, after: after))
        session.dataTask(with: request, decodable: [TWGame].self, result: result).resume()
    }
    
    func searchChannels(query: String, first: Int?, after: String?, liveOnly: Bool?, result: @escaping TWContainerBlock<[TWChannel]>) {
        let request = URLRequestBuilder.buildSecureAPIRequest(for: TWSearchChannelsRequest(query, first: first, after: after, liveOnly: liveOnly))
        session.dataTask(with: request, decodable: [TWChannel].self, result: result).resume()
    }
}
