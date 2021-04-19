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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - Public properties -

    var viewModel: ProductViewModel?
    var productId: String = ""
    weak var coordinator: MainCoordinator?

    // MARK: - LifeCycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel?.loadProductById()
    }

}

extension ProductViewController: ProductView {

    func startLoading() {
        activityIndicator.startAnimating()
    }

    func finishLoading() {
        activityIndicator.stopAnimating()
    }

    func setData(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = "\(product.price)"
    }

    func setEmptyView() {

    }

    func setErrorView() {

    }

}
