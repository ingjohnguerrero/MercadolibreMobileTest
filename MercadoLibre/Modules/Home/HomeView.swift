//
//  HomeView.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import Foundation

protocol HomeView: AnyObject {
    var searchTerm: String { get set }
    func startLoading()
    func finishLoading()
    func reloadAndShowTableView()
    func setEmptyView()
    func setErrorView()
    func showNoConnectionAlert()
}
