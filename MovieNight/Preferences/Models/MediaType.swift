//
//  MediaType.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

enum MediaType: String {
    case movies = "movie"
    case tvShows = "tv"
}

extension MediaType {
    var yearQueryString: String {
        switch self {
        case .movies: return "primary_release_year"
        case .tvShows: return "first_air_date_year"
        }
    }
}

// MARK: - JSON keys
extension MediaType {
    var posterJsonKey: String {
        return "poster_path"
    }
    
    var titleJsonKey: String {
        switch self {
        case .movies: return "title"
        case .tvShows: return "name"
        }
    }
    
    var overviewJsonKey: String {
        return "overview"
    }
    
    var yearJsonKey: String {
        switch self {
        case .movies: return "release_date"
        case .tvShows: return "first_air_date"
        }
    }
}
