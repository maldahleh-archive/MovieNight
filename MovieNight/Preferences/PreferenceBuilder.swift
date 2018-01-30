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
            AlertPresenter.displayAlertWith(message: "You did not agree on the type of media to watch.")
            return nil
        }
        
        mediaType = setOne.type
        
        let intersectedGenres = Set(setOne.selectedGenres).intersection(Set(setTwo.selectedGenres))
        if intersectedGenres.isEmpty {
            AlertPresenter.displayAlertWith(message: "You did not agree on any common genres.")
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
