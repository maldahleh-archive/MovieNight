//
//  PreferenceBuilder.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

struct PreferenceBuilder {
    let mediaType: Preferences.MediaType
    let year: Int
    var genreList: [Genre] = []
    
    init?(setOne: Preferences, setTwo: Preferences) {
        if setOne.type != setTwo.type {
            // TODO: Error, did not match
            return nil
        }
        
        mediaType = setOne.type
        
        // Find common genres between the two selected groups
        let intersectedGenres = Set(setOne.selectedGenres).intersection(Set(setTwo.selectedGenres))
        if intersectedGenres.isEmpty {
            // TODO: Error, no genre matches
            return nil
        }
        
        switch mediaType {
        case .movies:
            for genre in intersectedGenres {
                genreList.append(MovieGenre(rawValue: genre)!)
            }
        case .tvShows:
            for genre in intersectedGenres {
                genreList.append(TVGenre(rawValue: genre)!)
            }
        }
        
        // Searching year is the greater (more recent of the two selected years)
        year = setOne.year > setTwo.year ? setOne.year : setTwo.year
    }
}
