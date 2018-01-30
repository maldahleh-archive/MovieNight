//
//  PreferencesViewController.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController, UITableViewDelegate {
    // MARK: - UI Outlets
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var genreTable: UITableView!
    
    // MARK: - Class Properties
    var preferences = Preferences()
    
    lazy var dataSource = {
        return GenreDataSource(preferences: preferences)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genreTable.dataSource = dataSource
        genreTable.delegate = self
    }

    // MARK: - UI Actions
    @IBAction func mediaTypeChanged(_ sender: UISegmentedControl) {
        preferences.updateType(with: sender.selectedSegmentIndex)
        updateGenreLabel()
        genreTable.reloadData()
    }
    
    @IBAction func yearValueChanged(_ sender: UISlider) {
        let newYear = Int(sender.value)
        
        preferences.year = newYear
        updateYearLabel(with: newYear)
    }
}

// MARK: - Table View Delegate
extension PreferencesViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if let index = preferences.selectedGenres.index(of: row) {
            preferences.selectedGenres.remove(at: index)
        } else {
            if preferences.selectedGenres.count == 5 { return }
            
            preferences.selectedGenres.append(row)
        }
        
        genreTable.reloadRows(at: [indexPath], with: .automatic)
        updateGenreLabel()
    }
}

// MARK: - UI Helper
extension PreferencesViewController {
    func updateYearLabel(with value: Int) {
        yearLabel.text = "Newer Than (\(value))"
    }
    
    func updateGenreLabel() {
        genreLabel.text = "Genres (\(preferences.selectedGenres.count)/5)"
    }
}
