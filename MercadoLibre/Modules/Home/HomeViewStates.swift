//
//  HomeViewStates.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 13/04/21.
//

import Foundation

struct HomeStandByState: HomeViewState {
    
}

struct HomeSearchState: HomeViewState {
    var context: HomeViewModel
    
    func search(by term: String) {
        guard !context.searchTerm.isEmpty else {
            context.currentState = HomeStandByState()
            context.homeView.setEmptyView()
            context.homeView.finishLoading()
            return
        }
        context.currentState = HomeSearchingState(context: context)
        context.currentState.search(by: term)
    }
}

struct HomeSearchingState: HomeViewState {
    var context: HomeViewModel
    
    func search(by term: String) {
        context.homeView.startLoading()
        context.itemService?.items(byTerm: term) { (responseProducts, responseError) in
            context.currentState = HomeProcessingState(context: context, products: responseProducts, error: responseError)
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
            context.currentState = HomeStandByState()
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
