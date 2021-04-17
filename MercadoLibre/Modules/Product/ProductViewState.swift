//
//  ProductViewState.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 16/04/21.
//

import Foundation

protocol ProductViewState {
    func load()
    func handleResponse()
}

extension ProductViewState {
    func load() {
        print("\(#function) not implemented for \(self) state")
    }
    
    func handleResponse() {
        print("\(#function) not implemented for \(self) state")
    }
}
