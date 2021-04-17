//
//  ProductViewStates.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 16/04/21.
//

import Foundation

struct ProductStandByState: ProductViewState {
    
}

struct ProductLoadState: ProductViewState {
    var context: ProductViewModel
    
    func load() {
        guard !context.productId.isEmpty else {
            context.currentState = ProductStandByState()
            context.productView.setEmptyView()
            context.productView.finishLoading()
            return
        }
        context.currentState = ProductLoadingState(context: context)
        context.currentState.load()
    }
}

struct ProductLoadingState: ProductViewState {
    var context: ProductViewModel
    
    func load() {
        context.productView.startLoading()
        context.productService.item(byId: context.productId) { (responseProduct, reponseError) in
            context.currentState = ProductProcessingState(context: context, product: responseProduct, error: reponseError)
            context.currentState.handleResponse()
        }
    }
}

struct ProductProcessingState: ProductViewState {
    var context: ProductViewModel
    var product: Product?
    var error: Error?
    
    func handleResponse() {
        defer {
            context.currentState = ProductStandByState()
            context.productView.finishLoading()
        }
        
        guard error == nil else {
            context.productView.setErrorView()
            return
        }
        
        guard let currentProduct = product else {
            context.productView.setEmptyView()
            return
        }
        
        context.productView.setData(with: currentProduct)
    }
}
