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
        
        static let WebSegue = "toWebView"
    }
    
    // MARK: - Interface Builder Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Class properties
    lazy var dataSource: ResultsDataSource = {
        return ResultsDataSource(results: results, controller: self)
    }()
    
    var mediaType: MediaType!
    var results: [MediaResult]!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.ResultCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.WebSegue, sender: results[indexPath.row])
    }
}

// MARK: - Navigation
extension ResultsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != Constants.WebSegue { return }
        
        let selected = sender as! MediaResult
        let destinationVC = segue.destination as! WebViewController
        
        destinationVC.type = mediaType
        destinationVC.result = selected
    }
}
