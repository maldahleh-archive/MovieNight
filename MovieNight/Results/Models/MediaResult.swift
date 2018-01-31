//
//  Result.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

enum PosterArtworkState {
    case placeholder
    case downloaded
    case failed
}

class MediaResult: JSONDecodable {
    let posterEndpoint: String
    let id: String
    let title: String
    let overview: String
    let rating: String
    let release: String
    
    var poster: UIImage?
    var posterState: PosterArtworkState = .placeholder
    
    required init?(json: JSON, mediaType: MediaType) {
        guard let posterEndpoint = json[mediaType.posterJsonKey] as? String, let id = json[mediaType.idJsonKey] as? Int, let title = json[mediaType.titleJsonKey] as? String, let overview = json[mediaType.overviewJsonKey] as? String, let rating = json[mediaType.avereageRatingJsonKey] as? Double, let release = json[mediaType.yearJsonKey] as? String else {
            return nil
        }
        
        self.posterEndpoint = posterEndpoint
        self.id = String(id)
        self.title = title
        self.overview = overview
        self.rating = String(rating)
        self.release = release
    }
}
