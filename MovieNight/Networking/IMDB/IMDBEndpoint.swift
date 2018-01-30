//
//  IMDBEndpoint.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

enum IMDB {
    case discover(preferences: PreferenceBuilder)
}

extension IMDB: Endpoint {
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .discover(let preferences): return "/3/discover/\(preferences.mediaType.rawValue)"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .discover(let preferences):
            var preferencesQuerySet = preferences.querySet()
            // TODO: ADD API KEY
            preferencesQuerySet.append(URLQueryItem(name: "api_key", value: nil))
            
            return preferencesQuerySet
        }
    }
}
