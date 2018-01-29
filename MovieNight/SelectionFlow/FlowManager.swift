//
//  FlowManager.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class FlowManager: Resetable {
    let viewController: UIViewController
    
    var currentStatus: SelectionStatus {
        didSet {
            // TODO: Call update method in VC for new status
        }
    }
    
    init(viewController: UIViewController) {
        self.viewController = viewController
        self.currentStatus = .firstPending
    }
}

// MARK: Resetable Protocol Implementation
extension FlowManager {
    func reset() {
         self.currentStatus = .firstPending
    }
}
