//
//  SelectionStatus.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

enum SelectionStatus: Int {
    case firstPending = 0
    case secondPending
    case complete
    
    func next() -> SelectionStatus {
        let nextStatus = self.rawValue + 1
        return SelectionStatus(rawValue: nextStatus)!
    }
}

// MARK: - Status button mapping
extension SelectionStatus {
    var buttonString: String {
        switch self {
        case .firstPending: return "1st Person Select"
        case .secondPending: return "2nd Person Select"
        case .complete: return "View Results"
        }
    }
}
