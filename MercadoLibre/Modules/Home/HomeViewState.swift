//
//  HomeViewState.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import Foundation

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
