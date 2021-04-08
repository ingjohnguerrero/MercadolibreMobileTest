//
//  HomeView.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import Foundation

protocol HomeView: class {
    func startLoading()
    func finishLoading()
    func setResults(with products: [Product])
    func setEmptyView()
    func setErrorView()
}
