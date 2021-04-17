//
//  MainCoordinator.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 14/04/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let homeViewController = HomeViewController.instantiate()
        homeViewController.viewModel = HomeViewModel(view: homeViewController)
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: false)
    }

    func product(withId productId: String) {
        let productViewController = ProductViewController.instantiate(storyboard: .product)
        productViewController.viewModel = ProductViewModel(view: productViewController)
        productViewController.coordinator = self
        navigationController.present(productViewController, animated: true, completion: nil)
    }

}
