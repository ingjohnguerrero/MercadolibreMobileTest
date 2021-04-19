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
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var errorView: UIView!

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

    @IBAction func onRetryButtonTapped(_ sender: Any) {
        viewModel?.loadProductById()
    }
}

extension ProductViewController {
    func updateMainImageView(with imageUrlString: String) {
        let url = URL(string: imageUrlString)
        let placeholderImage = #imageLiteral(resourceName: "placeHolder")
        mainImageView.kf.setImage(
            with: url,
            placeholder: placeholderImage,
            options: [
                .loadDiskFileSynchronously,
                .cacheOriginalImage,
                .transition(.fade(0.25))
            ]
        )
    }
}

extension ProductViewController: ProductView {

    func startLoading() {
        activityIndicator.startAnimating()
        emptyView.isHidden = true
        errorView.isHidden = true
    }

    func finishLoading() {
        activityIndicator.stopAnimating()
    }

    func setData(with product: Product) {
        defer {
            emptyView.isHidden = true
            errorView.isHidden = true
        }
        titleLabel.text = product.title
        priceLabel.text = "\(product.price)"
        guard let firstImage = product.pictures?.first else {
            return
        }
        updateMainImageView(with: firstImage.secureUrl)
    }

    func setEmptyView() {
        emptyView.isHidden = false
    }

    func setErrorView() {
        errorView.isHidden = false
    }

}
