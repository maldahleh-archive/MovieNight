//
//  GenreDataSource.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class GenreDataSource: NSObject, UITableViewDataSource {
    let reuseIdentifier = "GenreCell"
    let preferences: Preferences
    
    init(preferences: Preferences) {
        self.preferences = preferences
    }
    
    // MARK: - Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let row = indexPath.row
        
        cell.textLabel?.text = cellTitle(for: row)
        if preferences.selectedGenres.contains(row) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

// MARK: - Helper methods
extension GenreDataSource {
    func numberOfRows() -> Int {
        switch preferences.type {
        case .movies: return MovieGenre.Count
        case .tvShows: return TVGenre.Count
        }
    }
    
    func cellTitle(for row: Int) -> String {
        switch preferences.type {
        case .movies: return MovieGenre(rawValue: row)!.name
        case .tvShows: return TVGenre(rawValue: row)!.name
        }
    }
}
