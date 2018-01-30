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
    
    let controller: ResultsViewController
    let pendingOperations = PendingOperations()
    
    init(results: [MediaResult], controller: ResultsViewController) {
        self.results = results
        self.controller = controller
        
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
            downloadPosterForResult(result, atIndexPath: indexPath)
        }
        
        return cell
    }
    
    // MARK: - Helper
    func downloadPosterForResult(_ result: MediaResult, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = PosterDownloader(result: result)
        downloader.completionBlock = {
            if downloader.isCancelled { return }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.controller.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
    
    func update(with results: [MediaResult]) {
        self.results = results
    }
}
