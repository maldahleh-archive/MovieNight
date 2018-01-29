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
}

// MARK: - Status button mapping
extension SelectionStatus {
    var buttonString: String {
        switch self {
        case .firstPending: return "Begin Selection"
        case .secondPending: return "Continue Selection"
        case .complete: return "View Results"
        }
    }
}
