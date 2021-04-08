//
//  HomeViewController.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlets -
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyView: UIView!
    
    // MARK: - Public properties -
    
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
    }
    
    func finishLoading() {
        
    }
    
    func setResults(with products: [Product]) {
        
    }
    
    func setEmptyView() {
        
    }
    
    func setErrorView() {
        
    }
    
}
