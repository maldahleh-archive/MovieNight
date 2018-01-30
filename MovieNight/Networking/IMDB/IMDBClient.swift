//
//  IMDBClient.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class IMDBClient: APIClient {
    static let apiKey = "api-key"
    
    let session = URLSession(configuration: .default)
    
    typealias DiscoverCompletionHandler = (Result<[MediaResult], APIError>) -> Void
    
    // MARK: - Discover
    func discoverWith(preferences: PreferenceBuilder, completion: @escaping DiscoverCompletionHandler) {
        let endpoint = IMDB.discover(preferences: preferences)
        let request = endpoint.request
        
        fetch(with: request, parse: { json -> [MediaResult] in
            guard let mediaResults = json["results"] as? [JSON] else { return [] }
            return mediaResults.flatMap { MediaResult(json: $0, mediaType: preferences.mediaType) }
        }, completion: completion)
    }
}
