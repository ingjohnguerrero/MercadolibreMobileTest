//
//  ProductViewController.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 12/04/21.
//

import UIKit

class ProductViewController: UIViewController, Storyboarded {

    // MARK: - IBOutlets -

    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - Public properties -

    var viewModel: ProductViewModel?
    var productId: String = ""
    weak var coordinator: MainCoordinator?

    // MARK: - LifeCycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ProductViewController: ProductView {

    func startLoading() {

    }

    func finishLoading() {

    }

    func setData(with product: Product) {

    }

    func setEmptyView() {

    }

    func setErrorView() {

    }

}
