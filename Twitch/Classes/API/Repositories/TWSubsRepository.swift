//
//  TWSubsRepository.swift
//  Screencast
//
//  Created by Øyvind Hauge on 30/07/2020.
//  Copyright © 2020 Øyvind Hauge. All rights reserved.
//

import Foundation

final class TWSubsRepository: TWSubsAPI {
    let session: URLSession = URLSession.shared
    
    func getBroadcasterSubscriptions(broadcasterId: String, userId: String?, result: TWContainerBlock<[TWSubscription]>) {
    }
}
