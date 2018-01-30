//
//  ResultsViewController.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate {
    private struct Constants {
        static let ResultCellHeight: CGFloat = 113.0
    }
    
    // MARK: - Interface Builder Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Class properties
    lazy var dataSource: ResultsDataSource = {
        return ResultsDataSource(results: [], controller: self)
    }()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.ResultCellHeight
    }
}
