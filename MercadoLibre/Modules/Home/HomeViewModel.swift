//
//  HomeViewModel.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import Foundation
import UIKit

protocol HomeViewState {
    func search(by term: String)
    func handleResponse()
}

extension HomeViewState {
    func search(by term: String) {
        print("\(#function) not implemented for \(self) state")
    }
    
    func handleResponse() {
        print("\(#function) not implemented for \(self) state")
    }
}

struct HomeStandByState: HomeViewState {
    
}

struct HomeSearchState: HomeViewState {
    var context: HomeViewModel
    
    func search(by term: String) {
        guard !context.searchTerm.isEmpty else {
            context.state = HomeStandByState()
            context.homeView.setEmptyView()
            context.homeView.finishLoading()
            return
        }
        context.state = HomeSearchingState(context: context)
        context.state.search(by: term)
    }
}

struct HomeSearchingState: HomeViewState {
    var context: HomeViewModel
    
    func search(by term: String) {
        context.homeView.startLoading()
        context.itemService.items(byTerm: term) { (responseProducts, responseError) in
            context.state = HomeProcessingState(context: context, products: responseProducts, error: responseError)
            context.currentState.handleResponse()
        }
    }
}

struct HomeProcessingState: HomeViewState {
    var context: HomeViewModel
    var products: [Product]
    var error: Error?
    
    func handleResponse() {
        defer {
            context.state = HomeStandByState()
            context.homeView.finishLoading()
        }
        
        guard error == nil else {
            context.homeView.setErrorView()
            return
        }
        
        guard !products.isEmpty else {
            context.homeView.setEmptyView()
            return
        }
        context.homeView.setResults(with: products)
    }
}

class HomeViewModel {
    
    // MARK: - Public properties -
    
    var homeView: HomeView {
        return view
    }
    
    var currentState: HomeViewState {
        return state
    }
    
    var itemService: ItemsService {
        return service
    }
    
    var searchTerm: String = "" {
        didSet {
            startSearching()
        }
    }
    
    // MARK: - Private properties -
    
    private unowned let view: HomeView
    fileprivate var state: HomeViewState = HomeStandByState()
    fileprivate var service: ItemsService
    
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
    func startSearching() {
        state = HomeSearchState(context: self)
        state.search(by: searchTerm)
    }
}
