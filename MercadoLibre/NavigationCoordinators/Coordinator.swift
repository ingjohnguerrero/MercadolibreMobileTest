//
//  Coordinator.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 14/04/21.
//

import Foundation
import UIKit

/// Navigation coordinator
protocol Coordinator {
    /// Child instances in case of having sub coordinators
    var childCoordinators: [Coordinator] { get set }
    /// Navigation controller handled by the coordinator
    var navigationController: UINavigationController { get set }
    /// Coordinator initialization
    func start()
}
