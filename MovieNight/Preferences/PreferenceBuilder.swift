//
//  PreferenceBuilder.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

extension Genre {
    var idString: String {
        return String(id)
    }
}

struct PreferenceBuilder {
    let mediaType: MediaType
    let year: Int
    var genreList: [String] = []
    
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
            genreList = intersectedGenres.map({ MovieGenre(rawValue: $0)!.idString })
        case .tvShows:
            genreList = intersectedGenres.map({ TVGenre(rawValue: $0)!.idString })
        }
        
        // Searching year is more recent of the two selected years
        year = setOne.year > setTwo.year ? setOne.year : setTwo.year
    }
    
    func querySet() -> [URLQueryItem] {
        return [
            URLQueryItem(name: "with_original_language", value: "en"),
            URLQueryItem(name: "with_genres", value: genreList.joined(separator: ",")),
            URLQueryItem(name: mediaType.yearQueryString, value: String(year))
        ]
    }
}
