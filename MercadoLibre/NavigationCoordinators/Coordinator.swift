//
//  Coordinator.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 14/04/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
