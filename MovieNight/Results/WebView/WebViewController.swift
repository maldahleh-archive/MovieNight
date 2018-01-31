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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.allowsBackForwardNavigationGestures = true
        
        
    }
    
    // MARK: - UI actions
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
