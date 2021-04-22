//
//  ProductView.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 16/04/21.
//

import Foundation

/// Protocol to handle the view controller instance
protocol ProductView: AnyObject {
    /// Requested product id
    var productId: String { get set }
    /// Tasks perform when the view starts loading
    func startLoading()
    /// Tasks perform when the view finish loading
    func finishLoading()
    /// Tasks perform when the product information needs to be set
    func setData(with product: Product)
    /// Tasks perform when no product was found for the given product id
    func setEmptyView()
    /// Tasks perform when an error occurs
    func setErrorView()
}
