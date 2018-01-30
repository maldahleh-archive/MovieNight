//
//  FlowManager.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

class FlowManager: Updateable, Resetable {
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

// MARK: - Protocol Implementation
extension FlowManager {
    func update() {
        self.currentStatus = currentStatus.next()
    }
    
    func reset() {
         self.currentStatus = .firstPending
    }
}
