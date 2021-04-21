//
//  MainCoordinator.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 14/04/21.
//

import Foundation
import UIKit

/// Main navigation coordinator, in charge of moving between the different views.
/// This app only requires one navigator by its size
class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.barTintColor = MeliTheme.Colors.backgroundColor
    }

    func start() {
        let homeViewController = HomeViewController.instantiate()
        homeViewController.viewModel = HomeViewModel(view: homeViewController)
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: false)
    }

    /// Instantiate and present the product details for the given productId
    /// - Parameter productId: Product Id for the selected product, this is unique for each one
    func product(withId productId: String) {
        let productViewController = ProductViewController.instantiate(storyboard: .product)
        productViewController.viewModel = ProductViewModel(view: productViewController)
        productViewController.productId = productId
        productViewController.coordinator = self
        navigationController.pushViewController(productViewController, animated: true)
    }

}
