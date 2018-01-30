//
//  Preferences.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

class Preferences {
    enum MediaType {
        case movies
        case tvShows
    }
    
    var type = MediaType.movies
    var year = 1900
    var selectedGenres = [Int]()
    
    func updateType(with value: Int) {
        selectedGenres = []
        
        switch value {
        case 0: type = .movies
        case 1: type = .tvShows
        default: return
        }
    }
}
