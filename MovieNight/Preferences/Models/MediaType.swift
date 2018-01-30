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
