//
//  ViewControllerAlertable.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 20/04/21.
//

import Foundation
import UIKit

protocol ViewControllerAlertable: UIViewController {
    func showAlert(title: String, message: String)
}

extension ViewControllerAlertable {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
