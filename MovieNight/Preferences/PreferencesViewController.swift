//
//  PreferencesViewController.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController {
    // MARK: - UI Outlets
    @IBOutlet weak var yearLabel: UILabel!
    
    // MARK: - Class Properties
    let preferences = Preferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UI Actions
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
