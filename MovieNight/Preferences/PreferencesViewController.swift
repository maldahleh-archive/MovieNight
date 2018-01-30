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
        genreTable.reloadData()
    }
    
    @IBAction func yearValueChanged(_ sender: UISlider) {
        let newYear = Int(sender.value)
        
        preferences.year = newYear
        updateYearLabel(with: newYear)
    }
}

// MARK: - UI Helper
extension PreferencesViewController {
    func updateYearLabel(with value: Int) {
        yearLabel.text = "Newer Than (\(value))"
    }
}
