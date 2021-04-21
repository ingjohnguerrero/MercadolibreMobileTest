//
//  Storyboarded.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 14/04/21.
//

import Foundation
import UIKit

/// Protocol in charge of instantiating the requested view controller depending of a given coordinator
protocol Storyboarded {
    /// Instance ViewController for the given coordinator
    /// - Parameter storyboard: Registered storyboard enum option
    static func instantiate(storyboard: CoordinatorStoryboards) -> Self
}

extension Storyboarded where Self: UIViewController {
    /// Default declaration of the instantiate method
    /// - Parameter storyboard: Storyboard where the view controller is contained
    /// - Returns: Instantiated UIViewController
    static func instantiate(storyboard: CoordinatorStoryboards = .main) -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let storyboard = UIStoryboard(name: storyboard.name, bundle: Bundle.main)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
