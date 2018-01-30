//
//  ResultsDataSource.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ResultsDataSource: NSObject, UITableViewDataSource {
    private var results: [MediaResult]
    
    let pendingOperations = PendingOperations()
    let tableView: UITableView
    
    init(results: [MediaResult], tableView: UITableView) {
        self.results = results
        self.tableView = tableView
        
        tableView.dataSource = self
        super.init()
    }
    
    // MARK: - Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.ReuseIdentifier, for: indexPath) as! ResultCell
        
        let result = results[indexPath.row]
        let viewModel = ResultViewModel(result: result)
        
        cell.populateView(with: viewModel)
        
        if result.posterState == .placeholder {
            // TODO: Download
        }
        
        return cell
    }
    
    // MARK: - Helper
    func downloadArtworkForResult(_ result: MediaResult, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = ArtworkDownloader(album: album)
        downloader.completionBlock = {
            if downloader.isCancelled { return }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
    
    func update(with albums: [Album]) {
        self.albums = albums
    }
}
