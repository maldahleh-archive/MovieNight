//
//  AlertBuilder.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-30.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class AlertPresenter {
    static func displayAlertWith(message: String) {
        if var controller = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = controller.presentedViewController {
                controller = presentedViewController
            }
            
            displayAlertWith(message: message, viewController: controller)
        }
    }
    
    static func displayAlertWith(message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: "Movie Night", message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}
