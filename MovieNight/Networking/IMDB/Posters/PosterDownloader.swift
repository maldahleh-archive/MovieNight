//
//  PosterDownloader.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation
import UIKit

class PosterDownloader: Operation {
    let result: MediaResult
    
    init(result: MediaResult) {
        self.result = result
        
        super.init()
    }
    
    override func main() {
        if isCancelled { return }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w75\(result.posterEndpoint)") else { return }
        
        do {
            let imageData = try Data(contentsOf: url)
            
            if isCancelled { return }
            
            if imageData.count > 0 {
                result.poster = UIImage(data: imageData)
                result.posterState = .downloaded
            } else {
                result.posterState = .failed
            }
        } catch {
            return
        }
    }
}
