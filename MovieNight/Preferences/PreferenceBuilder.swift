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
    
    func querySet() -> [URLQueryItem] {
        let genreIds = genreList.map({ String($0.id) }).joined(separator: ",")
        
        var yearQueryItem: URLQueryItem!
        switch mediaType {
        case .movies: yearQueryItem = URLQueryItem(name: "primary_release_year", value: String(year))
        case .tvShows: yearQueryItem = URLQueryItem(name: "first_air_date_year", value: String(year))
        }
        
        return [
            URLQueryItem(name: "with_original_language", value: "en"),
            URLQueryItem(name: "with_genres", value: genreIds),
            yearQueryItem
        ]
    }
}
