//
//  ViewController.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Resetable {
    private struct Keys {
        static let PreferencesSegue = "showPreferences"
        
        static let SelectedImage = "bubble-selected"
        static let UnselectedImage = "bubble-empty"
    }
    
    // MARK: - Interface Builder Outlets
    @IBOutlet weak var firstPersonStatus: UIImageView!
    @IBOutlet weak var secondPersonStatus: UIImageView!
    @IBOutlet weak var selectionButton: UIButton!
    
    // MARK: - Class properties
    var firstPreferences: Preferences?
    var secondPreferences: Preferences?
    
    lazy var flowManager = {
        return FlowManager(viewController: self)
    }()
    
    // MARK: - Interface Builder Actions
    @IBAction func selectionButtonTapped(_ sender: Any) {
        switch flowManager.currentStatus {
        case .firstPending, .secondPending:
            performSegue(withIdentifier: Keys.PreferencesSegue, sender: nil)
            flowManager.update()
        default: return
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        reset()
    }
    
    // MARK: - View Updating
    func updateSelectionButton(for status: SelectionStatus) {
        selectionButton.setTitle(status.buttonString, for: .normal)
    }
}

// MARK: - Resetable protocol implementation
extension ViewController {
    func reset() {
        firstPreferences = nil
        firstPersonStatus.image = UIImage(named: Keys.UnselectedImage)
        secondPreferences = nil
        secondPersonStatus.image = UIImage(named: Keys.UnselectedImage)
        
        flowManager.reset()
    }
}

// MARK: - Helper methods
extension ViewController {
    func receive(preferences: Preferences) {
        if firstPreferences == nil {
            firstPreferences = preferences
            firstPersonStatus.image = UIImage(named: Keys.SelectedImage)
        } else if secondPreferences == nil {
            secondPreferences = preferences
            secondPersonStatus.image = UIImage(named: Keys.SelectedImage)
        }
    }
}
