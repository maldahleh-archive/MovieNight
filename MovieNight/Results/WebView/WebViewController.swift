//
//  WebViewController.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    // MARK: - Interface Builder Outlets
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Class Properties
    var type: MediaType!
    var result: MediaResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spacedUrl = "\(type.tmdbUrl)\(result.id) \(result.title.lowercased())"
        let joinedUrl = spacedUrl.replacingOccurrences(of: " ", with: "-")
        
        guard let url = URL(string: joinedUrl) else {
            fatalError("URL construction failed, url: \(joinedUrl)")
        }
        
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url: url))
    }
    
    // MARK: - UI actions
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
