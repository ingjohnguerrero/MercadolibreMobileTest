//
//  HomeViewController.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {

    // MARK: - IBOutlets -

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyView: UIView!

    // MARK: - Public properties -

    var searchTerm: String = ""
    var viewModel: HomeViewModel?
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        HomeTableViewCell.registerCellPrototypes(tableView: tableView)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: HomeView {

    func startLoading() {
        activityIndicator.startAnimating()
        tableView.isHidden = true
        emptyView.isHidden = true
    }

    func finishLoading() {
        activityIndicator.stopAnimating()
    }

    func reloadAndShowTableView() {
        defer {
            self.tableView.reloadData()
        }
        tableView.isHidden = false
    }

    func setEmptyView() {
        emptyView.isHidden = false
    }

    func setErrorView() {

    }

}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerm = searchText
        viewModel?.startSearching()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchTerm = ""
        viewModel?.startSearching()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel?.productsCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let product = viewModel?.product(at: indexPath.row) else {
            return UITableViewCell()
        }

        let cell = HomeTableViewCell.dequeue(
            from: tableView,
            for: indexPath,
            with: ProductCellViewModel(
                product: product
            )
        )
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedProduct = viewModel?.product(at: indexPath.row) else {
            return
        }
        coordinator?.product(withId: selectedProduct.id)
    }
}
