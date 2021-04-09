//
//  HomeViewController.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlets -
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyView: UIView!
    
    // MARK: - Public properties -
    
    var viewModel: HomeViewModel!
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        HomeTableViewCell.registerCellPrototypes(tableView: tableView)
        
        guard (viewModel != nil) else {
            viewModel = HomeViewModel(view: self)
            return
        }
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
    
    func setResults(with products: [Product]) {
        tableView.isHidden = false
        self.products = products
        self.tableView.reloadData()
    }
    
    func setEmptyView() {
        emptyView.isHidden = false
    }
    
    func setErrorView() {
        
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchTerm = searchText
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModel.searchTerm = ""
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell.dequeue(from: tableView, for: indexPath, with: ProductCellViewModel(product: products[indexPath.row]))
        return cell
    }
}
