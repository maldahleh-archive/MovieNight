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
    let title: String
    let overview: String
    let release: String
    
    var poster: UIImage?
    var posterState: PosterArtworkState = .placeholder
    
    required init?(json: JSON, mediaType: MediaType) {
        guard let posterEndpoint = json[mediaType.posterJsonKey] as? String, let title = json[mediaType.titleJsonKey] as? String, let overview = json[mediaType.overviewJsonKey] as? String, let release = json[mediaType.yearJsonKey] as? String else {
            return nil
        }
        
        self.posterEndpoint = posterEndpoint
        self.title = title
        self.overview = overview
        self.release = release
    }
}