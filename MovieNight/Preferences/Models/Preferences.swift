//
//  Preferences.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

struct Preferences {
    enum MediaType {
        case movies
        case tvShows
    }
    
    var type = MediaType.movies
    var year = 1900
    
    mutating func updateType(with value: Int) {
        switch value {
        case 0: type = .movies
        case 1: type = .tvShows
        default: return
        }
    }
}
