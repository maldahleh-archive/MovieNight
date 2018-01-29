//
//  ViewController.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Resetable {
    // MARK: - Interface Builder Outlets
    @IBOutlet weak var firstPersonStatus: UIImageView!
    @IBOutlet weak var secondPersonStatus: UIImageView!
    @IBOutlet weak var selectionButton: UIButton!
    
    // MARK: - Class properties
    lazy var flowManager = {
        return FlowManager(viewController: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Interface Builder Actions
    @IBAction func selectionButtonTapped(_ sender: Any) {
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        reset()
    }
}

// MARK: - Resetable protocol implementation
extension ViewController {
    func reset() {
        struct Keys {
            static let UnselectedImage = "bubble-empty"
        }
        
        firstPersonStatus.image = UIImage(named: Keys.UnselectedImage)
        secondPersonStatus.image = UIImage(named: Keys.UnselectedImage)
        
        flowManager.reset()
    }
}
