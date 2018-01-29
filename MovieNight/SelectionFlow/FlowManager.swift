//
//  FlowManager.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

class FlowManager: Resetable {
    let viewController: ViewController
    
    var currentStatus: SelectionStatus {
        didSet {
            viewController.updateSelectionButton(for: currentStatus)
        }
    }
    
    init(viewController: ViewController) {
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
