//
//  ResultViewModel.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

struct ResultViewModel {
    let mediaPoster: UIImage? = nil
    let mediaName: String
    let mediaDescription: String
    let mediaYear: String
    
    init(result: MediaResult) {
        self.mediaName = result.title
        self.mediaDescription = result.overview
        self.mediaYear = result.release.components(separatedBy: "-").first!
        
        // TODO: Create image download request
    }
}
