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

    // MARK: - Private properties -

    private unowned let view: HomeView
    var state: HomeViewState = HomeStandByState()
    fileprivate var service: ItemsService!

    init(view: HomeView, service: ItemsService) {
        self.view = view
        self.service = service
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
}
