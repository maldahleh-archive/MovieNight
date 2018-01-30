//
//  Result.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

enum PosterArtworkState {
    case placeholder
    case downloaded
    case failed
}

struct MediaResult: JSONDecodable {
    let posterEndpoint: String
    let title: String
    let overview: String
    let release: String
    
    var poster: UIImage?
    var posterState: PosterArtworkState = .placeholder
}

extension MediaResult {
    init?(json: JSON, mediaType: MediaType) {
        guard let posterEndpoint = json[mediaType.posterJsonKey], let title = json[mediaType.titleJsonKey], let overview = json[mediaType.overviewJsonKey], let release = json[mediaType.yearJsonKey] else {
            return nil
        }
        
        self.posterEndpoint = posterEndpoint
        self.title = title
        self.overview = overview
        self.release = release
    }
}
