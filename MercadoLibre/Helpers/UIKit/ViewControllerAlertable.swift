//
//  ViewControllerAlertable.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 20/04/21.
//

import Foundation
import UIKit

/// Interface to compund a view controller and enable it to show alert views easier
protocol ViewControllerAlertable: UIViewController {

    /// Show aler for the given view controller
    /// - Parameters:
    ///   - title: Alert controller title
    ///   - message: Alert controller message
    func showAlert(title: String, message: String)
}

extension ViewControllerAlertable {

    /// Default implementation for the show alert view controller method
    /// - Parameters:
    ///   - title: alert title
    ///   - message: alert message
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
