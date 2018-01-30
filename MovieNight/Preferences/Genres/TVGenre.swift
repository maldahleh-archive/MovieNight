//
//  TVGenres.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

enum TVGenre: Int, Genre {
    static let Count = 15
    
    case action = 0
    case animation
    case comedy
    case crime
    case documentary
    case drama
    case family
    case kids
    case mystery
    case news
    case reality
    case sciFi
    case soap
    case talk
    case war
    case western
}

// MARK: - Genre protocol conformance
extension TVGenre {
    var name: String {
        switch  self {
        case .action: return "Action & Adventure"
        case .animation: return "Animation"
        case .comedy: return "Comedy"
        case .crime: return "Crime"
        case .documentary: return "Documentary"
        case .drama: return "Drama"
        case .family: return "Family"
        case .kids: return "Kids"
        case .mystery: return "Mystery"
        case .news: return "News"
        case .reality: return "Reality"
        case .sciFi: return "Sci-Fi & Fantasy"
        case .soap: return "Soap"
        case .talk: return "Talk"
        case .war: return "War & Politics"
        case .western: return "Western"
        }
    }
    
    var id: Int {
        switch self {
        case .action: return 10759
        case .animation: return 16
        case .comedy: return 35
        case .crime: return 80
        case .documentary: return 99
        case .drama: return 18
        case .family: return 10751
        case .kids: return 10762
        case .mystery: return 9648
        case .news: return 10763
        case .reality: return 10764
        case .sciFi: return 10765
        case .soap: return 10766
        case .talk: return 10767
        case .war: return 10768
        case .western: return 37
        }
    }
}
