//
//  HomeViewModel.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import Foundation
import UIKit

final class HomeViewModel {

    // MARK: - Public properties -
    
    /// Checks if there is an ongoing search
    var isPerformingSearch: Bool = false
    
    /// Accesor to home view instance
    var homeView: HomeView {
        return view
    }
    
    /// Current view model state
    var currentState: HomeViewState {
        get {
            return state
        }
        set {
            state = newValue
        }
    }

    /// View Model data source
    var itemService: ItemsService? {
        return service
    }

    /// Found product for term
    var products: [Product] = []
    
    /// Products count
    var productsCount: Int {
        return products.count
    }
    
    /// Current serach term
    var searchTerm: String {
        return view.searchTerm
    }
    
    /// Connection status
    var isNetworkReachable: Bool = true

    // MARK: - Private properties -
    
    /// Home view reference
    private unowned let view: HomeView
    /// Item service instance
    fileprivate var service: ItemsService!
    /// Current state and initial state
    fileprivate var state: HomeViewState = HomeStandByState()
    /// Connection manager
    fileprivate var reachabilityManager: AlamofireReachabilityManager!
    
    /// View model initializer
    /// - Parameters:
    ///   - view: home view instance to be managed
    ///   - service: view model data source
    init(view: HomeView, service: ItemsService) {
        self.view = view
        self.service = service
        self.reachabilityManager = AlamofireReachabilityManager()
        configureReachability()

    }
    
    /// Alternative initializer for the view model with default item service
    /// - Parameter view: home view instance to be managed
    convenience init(view: HomeView) {
        let alamofireService = AlamofireItemService()
        self.init(view: view, service: alamofireService)
    }

}

extension HomeViewModel {
    /// Set home view products
    /// - Parameter products: product to be shown
    func setResults(with products: [Product]) {
        self.products = products
        homeView.reloadAndShowTableView()
    }
    
    /// Get product by array index
    /// - Parameter index: product index
    /// - Returns: returns the requested product by index
    func product(at index: Int) -> Product {
        return products[index]
    }
    
    /// Perform seach by term and cancel all the ongoing requests
    func startSearching() {
        if isPerformingSearch {
            itemService?.cancelAllRequest()
        }
        state = HomeSearchState(context: self)
        state.search(by: searchTerm)
    }
    
    /// Setup connection manager
    fileprivate func configureReachability() {
        reachabilityManager.setStatusListeners { [weak self] in
            self?.isNetworkReachable = true
        } onNotReachableClosure: { [weak self] in
            self?.isNetworkReachable = false
            self?.view.showNoConnectionAlert()
        }

        reachabilityManager.startNetworkMonitoring()
    }
}
