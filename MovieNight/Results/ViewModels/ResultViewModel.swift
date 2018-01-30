//
//  ResultViewModel.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ResultViewModel {
    let mediaName: String
    let mediaDescription: String
    let mediaYear: String
    
    var mediaPoster: UIImage? = nil
    
    init(result: MediaResult) {
        self.mediaName = result.title
        self.mediaDescription = result.overview
        self.mediaYear = result.release.components(separatedBy: "-").first!
        
        if let poster = result.poster {
            mediaPoster = poster
        }
    }
}
