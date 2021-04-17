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
    
    var searchTerm: String = ""
    
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
    func updateSearchTerm() {
        searchTerm = view.searchTerm
    }
    
    func startSearching() {
        updateSearchTerm()
        state = HomeSearchState(context: self)
        state.search(by: searchTerm)
    }
}
