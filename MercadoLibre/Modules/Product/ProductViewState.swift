//
//  ProductViewState.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 16/04/21.
//

import Foundation

/// View state used to feed the state pattern for the product view
protocol ProductViewState {
    /// Tasks perform when the product details are requested to be load
    func load()
    /// Tasks perform when a service response with product details
    func handleResponse()
}

extension ProductViewState {
    /// Default implementation for the load method
    func load() {
        print("\(#function) not implemented for \(self) state")
    }
    /// Default implementation for the response hander method
    func handleResponse() {
        print("\(#function) not implemented for \(self) state")
    }
}
