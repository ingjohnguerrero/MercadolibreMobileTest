//
//  ProductViewStates.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 16/04/21.
//

import Foundation

/// Stand by state for the view
struct ProductStandByState: ProductViewState {

}

/// Initial state when a request for product details is done
struct ProductLoadState: ProductViewState {
    /// Current product view model handling a product view
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

/// Loading state when the requirements for the request are fulfilled
struct ProductLoadingState: ProductViewState {
    /// Current product view model handling a product view
    var context: ProductViewModel

    func load() {
        context.productView.startLoading()
        context.productService.item(byId: context.productId) { (responseProduct, reponseError) in
            context.currentState = ProductProcessingState(
                context: context,
                product: responseProduct,
                error: reponseError
            )
            context.currentState.handleResponse()
        }
    }
}

/// Processing state when the service response is received
struct ProductProcessingState: ProductViewState {
    /// Current product view model handling a product view
    var context: ProductViewModel
    /// Received product details
    var product: Product?
    /// Received response error
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
