//
//  TWAnalyticsRepository.swift
//  Screencast
//
//  Created by Øyvind Hauge on 31/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWAnalyticsRepository: TWAnalyticsAPI {
    let session: URLSession = URLSession.shared
    
    func getGameAnalytics(after: String?, startedAt: String?, endedAt: String?,
                          first: Int?, gameId: String?, type: String?,
                          result: TWContainerBlock<[TWGameAnalytics]>) {
    }
}
