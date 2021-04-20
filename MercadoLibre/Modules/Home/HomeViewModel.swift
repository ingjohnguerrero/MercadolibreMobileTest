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

    var isPerformingSearch: Bool = false

    var homeView: HomeView {
        return view
    }

    var currentState: HomeViewState {
        get {
            return state
        }
        set {
            state = newValue
        }
    }

    var itemService: ItemsService? {
        return service
    }

    var products: [Product] = []

    var productsCount: Int {
        return products.count
    }

    var searchTerm: String {
        return view.searchTerm
    }

    var state: HomeViewState = HomeStandByState()

    var isNetworkReachable: Bool = true

    // MARK: - Private properties -

    private unowned let view: HomeView
    fileprivate var service: ItemsService!
    fileprivate var reachabilityManager: AlamofireReachabilityManager!

    init(view: HomeView, service: ItemsService) {
        self.view = view
        self.service = service
        self.reachabilityManager = AlamofireReachabilityManager()
        configureReachability()

    }

    convenience init(view: HomeView) {
        let alamofireService = AlamofireItemService()
        self.init(view: view, service: alamofireService)
    }

}

extension HomeViewModel {
    func setResults(with products: [Product]) {
        self.products = products
        homeView.reloadAndShowTableView()
    }

    func product(at index: Int) -> Product {
        return products[index]
    }

    func startSearching() {
        if isPerformingSearch {
            itemService?.cancelAllRequest()
        }
        state = HomeSearchState(context: self)
        state.search(by: searchTerm)
    }

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
